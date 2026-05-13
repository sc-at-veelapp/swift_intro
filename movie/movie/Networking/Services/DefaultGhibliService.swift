import Foundation

struct DefaultGhibliService: MovieService {
    func fetchFilms(page: Int = 1, perPage: Int = 20) async throws -> [Movie] {
        let url = "https://ghibliapi.vercel.app/films"
        let data = try await fetch(from: url, type: [GhibliFilm].self)
        
        return data.map { film in
            Movie(
                id: film.id.hashValue,
                title: film.title,
                description: film.description,
                image: film.image,
                averageScore: nil,
                duration: Int(film.runningTime) ?? nil,
                studios: nil,
                staff: nil,
                characters: nil
            )
        }
    }

    func fetchMovieDetail(id: Int) async throws -> Movie {
        let films = try await fetchFilms()
        guard let film = films.first(where: { $0.id == id }) else {
            throw APIError.networkError
        }
        return film
    }

    func searchFilm(
        for searchTerm: String,
        page: Int = 1,
        perPage: Int = 20
    ) async throws -> [Movie] {
        let allFilms = try await fetchFilms()
        return allFilms.filter { film in
            film.title.localizedStandardContains(searchTerm)
        }
    }

    private func fetch<T: Decodable>(
        from URLString: String,
        type: T.Type
    ) async throws -> T {
        guard let url = URL(string: URLString) else {
            throw APIError.invalidURL
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode)
            else {
                throw APIError.invalidResponse
            }

            return try JSONDecoder().decode(type, from: data)
        } catch let error as DecodingError {
            throw APIError.decoding(error)
        } catch let error as URLError {
            throw APIError.networkError(error)
        }
    }
}

private struct GhibliFilm: Codable {
    let id: String
    let title: String
    let description: String
    let image: String
    let runningTime: String

    enum CodingKeys: String, CodingKey {
        case id, title, description, image
        case runningTime = "running_time"
    }
}

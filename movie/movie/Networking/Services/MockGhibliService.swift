import Foundation

struct MockGhibliService: MovieService {
    func fetchFilms(page: Int = 1, perPage: Int = 20) async throws -> [Movie] {
        let sampleData = try SampleDataLoader.loadSampleData()
        return sampleData.data.Page.media.map { SampleDataLoader.convertToMovie(from: $0) }
    }

    func fetchMovieDetail(id: Int) async throws -> Movie {
        let movies = try await fetchFilms()
        guard let movie = movies.first(where: { $0.id == id }) else {
            throw APIError.networkError
        }
        return movie
    }

    func searchFilm(for searchTerm: String, page: Int = 1, perPage: Int = 20) async throws -> [Movie] {
        let allMovies = try await fetchFilms()
        return allMovies.filter { $0.title.localizedStandardContains(searchTerm) }
    }
}

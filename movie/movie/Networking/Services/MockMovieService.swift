import Foundation

struct MockMovieService: MovieService {
    func fetchFilms(page: Int = 1, perPage: Int = 20) async throws -> [Movie] {
        let sampleData = try SampleDataLoader.loadSampleData()
        let allMovies = sampleData.data.Page.media.map { SampleDataLoader.convertToMovie(from: $0) }
        
        // Simple pagination
        let startIndex = (page - 1) * perPage
        let endIndex = min(startIndex + perPage, allMovies.count)
        return Array(allMovies[startIndex..<endIndex])
    }

    func fetchMovieDetail(id: Int) async throws -> Movie {
        let sampleData = try SampleDataLoader.loadSampleData()
        let movies = sampleData.data.Page.media.map { SampleDataLoader.convertToMovie(from: $0) }
        guard let movie = movies.first(where: { $0.id == id }) else {
            throw APIError.networkError
        }
        return movie
    }

    func searchFilm(for searchTerm: String, page: Int = 1, perPage: Int = 20) async throws -> [Movie] {
        let allMovies = try await fetchFilms(page: 1, perPage: 1000)
        let filtered = allMovies.filter { $0.title.localizedCaseInsensitiveContains(searchTerm) }
        
        // Simple pagination
        let startIndex = (page - 1) * perPage
        let endIndex = min(startIndex + perPage, filtered.count)
        return Array(filtered[startIndex..<endIndex])
    }
}

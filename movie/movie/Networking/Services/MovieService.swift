import Foundation

protocol MovieService: Sendable {
    func fetchFilms(page: Int, perPage: Int) async throws -> [Movie]
    func fetchMovieDetail(id: Int32) async throws -> Movie
    func searchFilm(for searchTerm: String, page: Int, perPage: Int) async throws -> [Movie]
}

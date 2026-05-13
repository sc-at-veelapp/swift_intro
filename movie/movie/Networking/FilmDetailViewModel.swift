import Foundation
import Observation

@Observable
class FilmDetailViewModel {
    var state: LoadingState<Movie> = .idle
    private let service: MovieService

    init(service: MovieService = AniListService()) {
        self.service = service
    }

    func fetch(for movieID: Int32) async {
        guard !state.isLoading else { return }
        state = .loading

        do {
            let movie = try await service.fetchMovieDetail(id: movieID)
            state = .loaded(movie)
        } catch let error as APIError {
            self.state = .error(error.errorDescription ?? "unknown error")
        } catch {
            self.state = .error("unknown error")
        }
    }
}

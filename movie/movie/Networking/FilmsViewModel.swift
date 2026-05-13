import Foundation
import Observation

@Observable
class FilmsViewModel {
    var state: LoadingState<[Movie]> = .idle
    var currentPage: Int = 1
    var hasMorePages: Bool = true
    
    private let service: MovieService
    private let perPage: Int = 10

    init(service: MovieService = AniListService()) {
        self.service = service
    }

    func fetch() async {
        guard !state.isLoading else { return }

        state = .loading

        do {
            let movies = try await service.fetchFilms(page: currentPage, perPage: perPage)
            
            if case .loaded(var existing) = state {
                self.state = .loaded(existing + movies)
            } else {
                self.state = .loaded(movies)
            }

            // Simple pagination check - if we got fewer than perPage, no more pages
            hasMorePages = movies.count == perPage
        } catch let error as APIError {
            self.state = .error(error.errorDescription ?? "unknown error")
        } catch {
            self.state = .error("unknown error")
        }
    }

    func fetchNextPage() async {
        guard hasMorePages else { return }
        currentPage += 1
        await fetch()
    }

    func reset() {
        state = .idle
        currentPage = 1
        hasMorePages = true
    }
}

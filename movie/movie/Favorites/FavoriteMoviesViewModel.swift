import Foundation
import Observation

@Observable
class FavoriteMoviesViewModel {
    var movies: [Movie] = []
    var isLoading: Bool = false
    var error: String?
    
    private let service: MovieService
    private var favoriteIDs: Set<String> = []

    init(service: MovieService = AniListService()) {
        self.service = service
    }

    func loadFavorites(favoriteIDs: Set<String>) async {
        guard !favoriteIDs.isEmpty else {
            self.movies = []
            return
        }
        
        self.favoriteIDs = favoriteIDs
        isLoading = true
        error = nil
        movies = []

        var loadedMovies: [Movie] = []
        
        await withTaskGroup(of: Movie?.self) { group in
            for idString in favoriteIDs {
                guard let id = Int32(idString) else { continue }
                group.addTask {
                    do {
                        return try await self.service.fetchMovieDetail(id: id)
                    } catch {
                        return nil
                    }
                }
            }
            
            for await movie in group {
                if let movie = movie {
                    loadedMovies.append(movie)
                }
            }
        }

        self.movies = loadedMovies
        self.isLoading = false
    }
}

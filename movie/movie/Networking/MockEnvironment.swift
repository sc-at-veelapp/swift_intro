import Foundation

// MARK: - Mock Helpers for Testing & Previews

/// Use this to quickly set up a test environment with mock data
class MockEnvironment {
    /// Returns a FilmsViewModel with mock service for preview/testing
    static func makeFilmsViewModelWithMocks() -> FilmsViewModel {
        FilmsViewModel(service: MockMovieService())
    }

    /// Returns a SearchFilmsViewModel with mock service for preview/testing
    static func makeSearchViewModelWithMocks() -> SearchFilmsViewModel {
        SearchFilmsViewModel(service: MockMovieService())
    }

    /// Returns a FilmDetailViewModel with mock service for preview/testing
    static func makeDetailViewModelWithMocks() -> FilmDetailViewModel {
        FilmDetailViewModel(service: MockMovieService())
    }

    /// Returns a FavoriteMoviesViewModel with mock service for preview/testing
    static func makeFavoriteMoviesViewModelWithMocks() -> FavoriteMoviesViewModel {
        FavoriteMoviesViewModel(service: MockMovieService())
    }

    /// Quick helper to get sample movie IDs from SampleData for testing favorites
    static func getSampleMovieIDs() throws -> Set<String> {
        let sampleData = try SampleDataLoader.loadSampleData()
        let ids = sampleData.data.Page.media.prefix(3).map { String($0.id) }
        return Set(ids)
    }
}

// MARK: - Preview Examples

#if DEBUG
extension FilmsViewModel {
    static func previewWithMocks() -> FilmsViewModel {
        let vm = FilmsViewModel(service: MockMovieService())
        return vm
    }
}

extension SearchFilmsViewModel {
    static func previewWithMocks() -> SearchFilmsViewModel {
        SearchFilmsViewModel(service: MockMovieService())
    }
}

extension FavoritesViewModel {
    static func previewMocks() -> FavoritesViewModel {
        FavoritesViewModel(service: MockFavoriteStorage())
    }
}
#endif

import SwiftUI

struct SearchScreen: View {
    @State private var text: String = ""
    @State private var searchViewModel: SearchFilmsViewModel

    let favoritesViewModel: FavoritesViewModel

    init(
        favoritesViewModel: FavoritesViewModel,
        service: MovieService = AniListService()
    ) {
        self.favoritesViewModel = favoritesViewModel
        self.searchViewModel = SearchFilmsViewModel(service: service)
    }

    var body: some View {
        NavigationStack {
            VStack {
                switch searchViewModel.state {
                case .idle:
                    Text("search results will be shown here.")
                        .foregroundStyle(.secondary)
                case .loading:
                    ProgressView()
                case .error(let error):
                    Text(error)
                case .loaded(let movies):
                    FilmListView(
                        movies: movies,
                        favoritesViewModel: favoritesViewModel
                    )
                }
            }
            .navigationTitle("search movies")
            .searchable(text: $text)
            .task(id: text) {
                await searchViewModel.fetch(for: text)
            }
        }
    }
}

#Preview {
    SearchScreen(
        favoritesViewModel: FavoritesViewModel(service: MockFavoriteStorage())
    )
}

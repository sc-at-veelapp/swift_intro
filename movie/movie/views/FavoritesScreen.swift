import SwiftUI

struct FavoritesScreen: View {
    let favoritesViewModel: FavoritesViewModel
    @State private var favoriteMoviesViewModel = FavoriteMoviesViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if favoritesViewModel.favoriteIDs.isEmpty {
                    ContentUnavailableView(
                        "No Favorites yet",
                        systemImage: "heart"
                    )
                } else if favoriteMoviesViewModel.isLoading {
                    ProgressView()
                } else if !favoriteMoviesViewModel.movies.isEmpty {
                    FilmListView(
                        movies: favoriteMoviesViewModel.movies,
                        favoritesViewModel: favoritesViewModel
                    )
                } else if let error = favoriteMoviesViewModel.error {
                    Text("Error loading favorites: \(error)")
                        .foregroundStyle(.pink)
                } else {
                    ContentUnavailableView(
                        "No Favorites yet",
                        systemImage: "heart"
                    )
                }
            }
            .navigationTitle("Favorites")
            .task(id: favoritesViewModel.favoriteIDs) {
                await favoriteMoviesViewModel.loadFavorites(
                    favoriteIDs: favoritesViewModel.favoriteIDs
                )
            }
        }
    }
}

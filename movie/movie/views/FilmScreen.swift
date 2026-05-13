import SwiftUI

struct FilmsScreen: View {
    let filmsViewModel: FilmsViewModel
    let favoritesViewModel: FavoritesViewModel

    var body: some View {
        NavigationStack {
            VStack {
                switch filmsViewModel.state {
                case .idle:
                    Text("No movies yet")

                case .loading:
                    ProgressView {
                        Text("Loading ...")
                    }
                case .loaded(let movies):
                    FilmListView(
                        movies: movies,
                        favoritesViewModel: favoritesViewModel
                    )
                case .error(let error):
                    Text(error)
                        .foregroundStyle(.pink)
                }
            }
            .navigationTitle("Movies")
            .task {
                if case .idle = filmsViewModel.state {
                    await filmsViewModel.fetch()
                }
            }
        }
    }
}

import SwiftUI

struct FilmsScreen: View {
    let filmsViewModel: FilmsViewModel
    let favoritesViewModel: FavoritesViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                MeshGradient(
                    width: 5,
                    height: 3,
                    points: [
                        [0.0, 0.0], [0.25, 0.0], [0.5, 0.0], [0.75, 0.0],
                        [1.0, 0.0],
                        [0.0, 0.5], [0.25, 0.5], [0.5, 0.5], [0.75, 0.5],
                        [1.0, 0.5],
                        [0.0, 1.0], [0.25, 1.0], [0.5, 1.0], [0.75, 1.0],
                        [1.0, 1.0],
                    ],
                    colors: [
                        Color(red: 0.93, green: 0.95, blue: 1.0, opacity: 0.5),
                        Color(red: 0.93, green: 0.95, blue: 1.0, opacity: 0.5),
                        Color(red: 0.92, green: 0.94, blue: 1.0, opacity: 0.5),
                        Color(red: 0.92, green: 0.94, blue: 1.0, opacity: 0.5),
                        Color(red: 0.92, green: 0.94, blue: 1.0, opacity: 0.5),

                        Color(red: 0.92, green: 0.94, blue: 1.0, opacity: 0.5),
                        Color(red: 0.91, green: 0.93, blue: 1.0, opacity: 0.5),
                        Color(red: 0.91, green: 0.93, blue: 1.0, opacity: 0.5),
                        Color(red: 0.90, green: 0.95, blue: 1.0, opacity: 0.5),
                        Color(red: 0.84, green: 0.93, blue: 1.0, opacity: 0.5),

                        Color(red: 0.92, green: 0.94, blue: 1.0, opacity: 0.5),
                        Color(red: 0.91, green: 0.93, blue: 1.0, opacity: 0.5),
                        Color(red: 0.90, green: 0.94, blue: 1.0, opacity: 0.5),
                        Color(red: 0.76, green: 0.90, blue: 1.0, opacity: 0.5),
                        Color(red: 0.62, green: 0.86, blue: 1.0, opacity: 0.5),
                    ]
                )
                .ignoresSafeArea()

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

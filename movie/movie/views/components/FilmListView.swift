import SwiftUI

struct FilmListView: View {
    var movies: [Movie]
    let favoritesViewModel: FavoritesViewModel

    var body: some View {
        List(movies) { movie in
            NavigationLink(value: movie.id) {
                FilmRow(
                    movie: movie,
                    favoritesViewModel: favoritesViewModel
                )
            }.listRowBackground(Color.clear)
        }
        .scrollContentBackground(.hidden)
        .background(Color.clear)
        .navigationDestination(for: Int.self) { movieID in
            FilmDetailScreen(
                movieID: movieID,
                favoritesViewModel: favoritesViewModel
            )
        }
    }
}

private struct FilmRow: View {
    let movie: Movie
    let favoritesViewModel: FavoritesViewModel

    var body: some View {
        HStack(alignment: .top) {
            FilmImageView(urlPath: movie.image ?? "")
                .frame(
                    width: 100,
                    height: 150
                )
            VStack(alignment: .leading) {
                HStack {
                    Text(movie.title).fontWeight(.semibold)
                    Spacer()
                    FavoriteButton(
                        filmID: String(movie.id),
                        favoritesViewModel: favoritesViewModel
                    )
                    .buttonStyle(.plain)
                    .controlSize(.large)
                }
                .padding(.bottom, 5)

                if let score = movie.averageScore {
                    Text("Score: \(score)/100")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                if let duration = movie.duration {
                    Text("Duration: \(duration) min")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.top)
        }
    }
}

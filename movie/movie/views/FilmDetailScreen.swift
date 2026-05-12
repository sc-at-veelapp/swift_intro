import SwiftUI

struct FilmDetailScreen: View {
    let film: Film
    let favoritesViewModel: FavoritesViewModel

    @State private var viewModel = FilmDetailViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                FilmImageView(urlPath: film.bannerImage)
                    .frame(height: 300)
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .containerRelativeFrame(.horizontal)
                    .ignoresSafeArea(edges: .top)
                    .stretchy()

                VStack(
                    alignment: .leading,
                    spacing: 10
                ) {
                    Text(film.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Grid(alignment: .leading) {
                        InfoRow(label: "Director", value: film.director)
                        InfoRow(label: "Producer", value: film.producer)
                        InfoRow(label: "Release Date", value: film.releaseYear)
                        InfoRow(
                            label: "Running Time",
                            value: "\(film.duration) minutes"
                        )
                        InfoRow(label: "Score", value: "\(film.score)/100")
                    }
                    .padding(.vertical, 8)

                    Divider().padding()

                    Text("Description")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(film.description)

                    Divider().padding()

                    CharacterSectionView(viewModel: viewModel)
                }
                .padding()
            }
        }
        .toolbar {
            FavoriteButton(
                filmID: film.id,
                favoritesViewModel: favoritesViewModel
            )
        }.ignoresSafeArea(edges: .top)
        .task(id: film) {
            await viewModel.fetch(for: film)
        }
    }
}

private struct InfoRow: View {
    let label: String
    let value: String

    var body: some View {
        GridRow {
            Text(label)
                .font(.subheadline)
                .fontWeight(.medium)
                .frame(width: 100, alignment: .leading)

            Text(value)
                .font(.subheadline)

        }
    }
}

private struct CharacterSectionView: View {
    let viewModel: FilmDetailViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Characters")
                .font(.headline)
                .fontWeight(.semibold)

            switch viewModel.state {
            case .idle: EmptyView()
            case .loading: ProgressView()
            case .loaded(let people):
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 12) {
                        ForEach(people) { person in
                            VStack(spacing: 8) {
                                Image(systemName: "photo")
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.gray.opacity(0.3))
                                    .cornerRadius(150)

                                Text(person.name)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                    .lineLimit(1)
                                    .frame(width: 80)
                            }
                            .padding()
                        }
                    }
                    .padding(.horizontal)
                }
            case .error(let error):
                Text(error)
                    .foregroundStyle(.pink)
            }
        }
    }
}

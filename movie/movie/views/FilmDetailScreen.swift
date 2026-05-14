import SwiftUI

struct FilmDetailScreen: View {
    let movieID: Int
    let favoritesViewModel: FavoritesViewModel

    @State private var viewModel = FilmDetailViewModel()

    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 0) {
                    if case .loaded(let movie) = viewModel.state {
                        FilmImageView(urlPath: movie.image ?? "")
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
                            Text(movie.title)
                                .font(.largeTitle)
                                .fontWeight(.bold)

                            Grid(alignment: .leading) {
                                if let score = movie.averageScore {
                                    InfoRow(
                                        label: "Score",
                                        value: "\(score)/100"
                                    )
                                }
                                if let duration = movie.duration {
                                    InfoRow(
                                        label: "Duration",
                                        value: "\(duration) minutes"
                                    )
                                }
                                if let studios = movie.studios?.joined(
                                    separator: ", "
                                ) {
                                    InfoRow(label: "Studios", value: studios)
                                }
                            }
                            .padding(.vertical, 8)

                            Divider().padding()

                            if let description = movie.description,
                                !description.isEmpty
                            {
                                // TODO: description now has html tags :(.
                                // look for packages that support rich text to swiftui text view ig
                                Text("Description")
                                    .font(.title2)
                                    .fontWeight(.semibold)

                                // removes all styling and also only strips html tags
                                Text(htmlToAttributedString(description))
                                    .fontDesign(.default)
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                
                                // Text("**bold** text and _italic_ text")

                                Divider().padding()
                            }

                            if let characters = movie.characters,
                                !characters.isEmpty
                            {
                                CharacterSectionView(characters: characters)
                            }
                        }
                        .padding()
                    } else {
                        VStack {
                            if case .error(let error) = viewModel.state {
                                Text("Error: \(error)")
                            } else {
                                ProgressView()
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
            }
        }
        .toolbar {
            FavoriteButton(
                filmID: String(movieID),
                favoritesViewModel: favoritesViewModel
            )
        }
        .ignoresSafeArea(edges: .top)
        .task(id: movieID) {
            await viewModel.fetch(for: Int32(movieID))
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
    let characters: [Character]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Characters")
                .font(.title2)
                .fontWeight(.semibold)

            ForEach(characters) { character in
                HStack(alignment: .top, spacing: 12) {
                    if let image = character.image {
                        FilmImageView(urlPath: image)
                            .frame(width: 60, height: 80)
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text(character.name)
                            .font(.subheadline)
                            .fontWeight(.semibold)

                        if let role = character.role {
                            Text(role)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }

                        if let voiceActors = character.voiceActors,
                            !voiceActors.isEmpty
                        {
                            VStack(alignment: .leading, spacing: 2) {
                                ForEach(voiceActors) { actor in
                                    Text("VA: \(actor.name)")
                                        .font(.caption2)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }

                    Spacer()
                }
                .padding(.vertical, 8)
            }
        }
    }
}

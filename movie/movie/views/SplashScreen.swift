import SwiftUI

struct Splash: View {
    @Environment(AppState.self) private var appState

    var body: some View {
        ZStack() {
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
                    Color(red: 0.93, green: 0.95, blue: 1.0),
                    Color(red: 0.93, green: 0.95, blue: 1.0),
                    Color(red: 0.92, green: 0.94, blue: 1.0),
                    Color(red: 0.92, green: 0.94, blue: 1.0),
                    Color(red: 0.92, green: 0.94, blue: 1.0),

                    Color(red: 0.92, green: 0.94, blue: 1.0),
                    Color(red: 0.91, green: 0.93, blue: 1.0),
                    Color(red: 0.91, green: 0.93, blue: 1.0),
                    Color(red: 0.90, green: 0.95, blue: 1.0),
                    Color(red: 0.84, green: 0.93, blue: 1.0),

                    Color(red: 0.92, green: 0.94, blue: 1.0),
                    Color(red: 0.91, green: 0.93, blue: 1.0),
                    Color(red: 0.90, green: 0.94, blue: 1.0),
                    Color(red: 0.76, green: 0.90, blue: 1.0),
                    Color(red: 0.62, green: 0.86, blue: 1.0),
                ]
            )
            .ignoresSafeArea()

            VStack {
                //Spacer()

                TitleView()
                InformationContainerView()

                Spacer(minLength: 30)

                Button {
                    appState.hasEnteredApp = true
                } label: {
                    Text("Continue")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(width: 280, height: 50)
                        .padding(.horizontal, 20)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(50)
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            Image("gradientsIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180)
                .accessibility(hidden: true)

            Text("Anime Movies")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.primary)
        }
    }
}

struct InformationDetailView: View {
    var title: String = "title"
    var subTitle: String = "subTitle"

    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .accessibility(addTraits: .isHeader)

                Text(subTitle)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.top)
    }
}

struct InformationContainerView: View {
    var body: some View {
        VStack(alignment: .leading) {
            InformationDetailView(
                title: "Explore movies easily",
                subTitle:
                    "Explore ghibli movies and see how they match your taste."
            )

            InformationDetailView(
                title: "Favorite the ones you love",
                subTitle: "Heart your favorite movies and see them in tab view.",
            )

            InformationDetailView(
                title: "Set your settings",
                subTitle:
                    "Configure everything in the integrated settings easily."
            )
        }
        .padding(.horizontal)
    }
}

#Preview {
    Splash()
}

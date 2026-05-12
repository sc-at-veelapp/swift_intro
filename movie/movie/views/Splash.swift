import SwiftUI

struct Splash: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Spacer()
                TitleView()
                InformationContainerView()
                Spacer(minLength: 30)
                Button(action: {
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.success)
                }) {
                    Text("Continue").background()
                }
                .padding(.horizontal)
            }
        }

    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            Image("gradientsIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, alignment: .center)
                .accessibility(hidden: true)

            Text("Welcome to\nGhibli Movies")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
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

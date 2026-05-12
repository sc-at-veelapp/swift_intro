import SwiftUI

struct FrameworkDetailView: View {
    var framework: Framework
    @Binding var isShowingDetailView: Bool

    var body: some View {
        VStack {
            HStack {
                Spacer()
                XDismissButton(isShowingDetailView: $isShowingDetailView)
            }

            Spacer()

            FrameworkTitleView(framework: framework)
            Text(framework.description).font(.body).padding()

            Spacer()
            
            Link(destination: URL(string: framework.urlString)!) {
                AFButton(title: "Learn more about \(framework.name)!")
            }
        }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(
            framework: MockData.sampleFramework,
            isShowingDetailView: .constant(false)
        )
    }
}

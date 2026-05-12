import SwiftUI


struct XDismissButton: View {
    @Binding var isShowingDetailView: Bool

    var body: some View {
        Button {
            isShowingDetailView = false
        } label : {
            Image(systemName: "xmark")
                .foregroundColor(Color(.label))
                .imageScale(.large)
                .frame(width: 44, height: 44)
                .padding(15)
        }
    }
}

import SwiftUI


struct AFButton: View {
    var title: String

    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .padding(.horizontal, 20)
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(50)
    }
}

struct AFButton_Previews: PreviewProvider {
    static var previews: some View {
        AFButton(title: "Learn More!")
    }
}

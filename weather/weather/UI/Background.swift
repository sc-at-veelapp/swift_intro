import SwiftUI

struct Background: View {
    var isNight: Bool
    
    var topColor: Color {
        isNight ? .black : .blue
    }

    var bottomColor: Color {
        isNight ? .gray : .white
    }

    var body: some View {
//        ContainerRelativeShape()
//            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
//            .ignoresSafeArea()
        LinearGradient(
            gradient: Gradient(colors: [topColor, bottomColor]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ).ignoresSafeArea(.all)
    }
}

import SwiftUI

// TODO: does not work. idk why. to be investigated.
// <https://nilcoalescing.com/blog/StretchyHeaderInSwiftUI>

// misc:
// - <https://developer.apple.com/documentation/SwiftUI/Landmarks-Building-an-app-with-Liquid-Glass>

extension View {
    func stretchy() -> some View {
        visualEffect { effect, geometry in
            let currentHeight = geometry.size.height
            let scrollOffset = geometry.frame(in: .scrollView).minY
            let positiveOffset = max(0, scrollOffset)

            let newHeight = currentHeight + positiveOffset
            let scaleFactor = newHeight / currentHeight

            return effect.scaleEffect(
                x: scaleFactor,
                y: scaleFactor,
                anchor: .bottom
            )
        }
    }
}

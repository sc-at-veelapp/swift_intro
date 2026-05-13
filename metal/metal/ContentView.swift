import MetalKit
import SwiftUI

struct ContentView: UIViewRepresentable {
    func makeCoordinator() -> Renderer {
        Renderer(self)
    }

    func makeUIView(context: UIViewRepresentableContext<ContentView>) -> MTKView
    {
        let mtkview = MTKView()
        mtkview.delegate = context.coordinator
        mtkview.preferredFramesPerSecond = 60
        mtkview.enableSetNeedsDisplay = true

        if let metalDevice = MTLCreateSystemDefaultDevice() {
            mtkview.device = metalDevice
        }

        mtkview.framebufferOnly = false
        mtkview.drawableSize = mtkview.frame.size

        return mtkview
    }

    func updateUIView(
        _ uiView: MTKView,
        context: UIViewRepresentableContext<ContentView>
    ) {
    }

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

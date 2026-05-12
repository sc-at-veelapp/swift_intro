import SwiftUI

@main
struct apple_frameworksApp: App {
    @StateObject var viewModel = FrameworkGridViewModel()

    var body: some Scene {
        WindowGroup {
                NavigationView {
                    ScrollView {
                        // had we used list, we could just do
                        // NavigationLink(destination: FrameworkDetailView(framework: framework, isShowingDetailsView: $viewModel.isShowingDetailView)) { FrameworkTitleView(framework: framework) }
                        LazyVGrid(columns: viewModel.columns) {
                            // FrameworkTitleView(imageName: "app-clip",    title: "App Clips")
                            // FrameworkTitleView(imageName: "arkit",       title: "Ar Kit")
                            // FrameworkTitleView(imageName: "carplay",     title: "Car Play")
                            // FrameworkTitleView(imageName: "classkit",    title: "Class Kit")
                            // FrameworkTitleView(imageName: "cloudkit",    title: "Cloud Kit")
                            // FrameworkTitleView(imageName: "coreml",      title: "Core ML")
                            // FrameworkTitleView(imageName: "healthkit",   title: "Health Kit")
                            // FrameworkTitleView(imageName: "mapkit",      title: "Map Kit")
                            // FrameworkTitleView(imageName: "metal",       title: "Metal")
                            // FrameworkTitleView(imageName: "sf-symbols",  title: "SF Symbols")
                            // FrameworkTitleView(imageName: "sirikit",     title: "Siri Kit")
                            // FrameworkTitleView(imageName: "spritekit",   title: "Sprite Kit")
                            // FrameworkTitleView(imageName: "swiftui",     title: "Swift UI")
                            // FrameworkTitleView(imageName: "test-flight", title: "Test Flight")
                            // FrameworkTitleView(imageName: "tipkit",      title: "Tip Kit")
                            // FrameworkTitleView(imageName: "wallet",      title: "Wallet")
                            // FrameworkTitleView(imageName: "widgetkit",   title: "Widget Kit")
                            ForEach(MockData.frameworks) { framework in
                                FrameworkTitleView(
                                    framework: framework
                                ).onTapGesture {
                                    viewModel.selectedFramework = framework
                                }
                            }
                        }
                    }
                    .navigationTitle("🍎 Frameworks")
                    .sheet(isPresented: $viewModel.isShowingDetailView) {
                        FrameworkDetailView(framework: viewModel.selectedFramework!, isShowingDetailView: $viewModel.isShowingDetailView)
                    }
                }
        }
    }
}
//
//
//#Preview {
//    apple_frameworksApp()
//}

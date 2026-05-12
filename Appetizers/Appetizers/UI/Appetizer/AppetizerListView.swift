import SwiftUI
import Combine

struct AppetizerListView: View {
    // @State private var appetizers: [Appetizer] = []
    @StateObject var viewModel = AppetizerListViewModel()

    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                //List(MockData.orderItems, id: \.id) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .listRowSeparator(.hidden)
                    // .listRowSeparatorTint(.brandPrimary)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("🍊 Appetizers")
                //.navigationBarTitleDisplayMode(.inline)
                .listStyle(.plain)
                .disabled(viewModel.isShowingDetail)
            }
            //.onAppear(perform: viewModel.getAppetizers)
            .task {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!,
                                    isShowingDetail: $viewModel.isShowingDetail)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct Appetizer_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}

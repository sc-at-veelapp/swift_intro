import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order: Order

    var body: some View {
        TabView {
            AppetizerListView().tabItem {
                Label("Home", systemImage: "house")
            }
            AccountView().tabItem {
                Label("Account", systemImage: "person.circle")
            }
            OrderView().tabItem {
                Label(
                    "Orders",
                    systemImage: "list.bullet.rectangle.portrait.fill"
                )
            }//.badge(order.items.count)
        }
    }
}

#Preview {
    AppetizerTabView()
}

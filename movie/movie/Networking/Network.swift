import Apollo
import Foundation

final class Network {
    static let shared = Network()

    let client: ApolloClient

    private init() {
        client = ApolloClient(url: URL(string: "https://graphql.anilist.co")!)
    }
}

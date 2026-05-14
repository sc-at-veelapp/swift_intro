import Foundation

protocol FeedRepository {
    func fetchFeed() async throws -> Feed
}

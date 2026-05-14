import Foundation
import Observation

@MainActor
@Observable
final class FeedViewModel {
    var videos: [Video] = []
    var isLoading = false
    var error: String?

    private let repository: FeedRepository

    init(repository: FeedRepository = MockFeedRepository()) {
        self.repository = repository
    }

    func loadFeed() async {
        isLoading = true
        
        defer { isLoading = false }

        do {
            let feed = try await repository.fetchFeed()
            videos = feed.feedRequest
        } catch {
            self.error = error.localizedDescription
        }

        isLoading = false
    }
}

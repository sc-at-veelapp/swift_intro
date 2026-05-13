import Foundation
import Observation

@Observable
class FeedViewModel {
    var feed: Feed = []
    var isLoading: Bool = false
    var error: String?

    private let service: FeedStorage

    init(service: FeedStorage = MockFeed()) {
        self.service = service
    }
    
    func getFeed() -> Feed {
        isLoading = true
        feed = service.get()
        isLoading = false
        return feed
    }

//    func resolveURL(feed: Feed, resolution: Resolution) async -> URL {
//        
//    }
}

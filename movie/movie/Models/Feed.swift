import Foundation

struct Feed: Codable, Equatable {
    let feedRequest: [Video]
}

struct Video: Codable, Equatable, Identifiable {
    let id: String
    let title: String
    let description: String
    let thumbnailURL: String
    // i suppose IRL this would not be here.
    // a feed would have to be resolved to resolution specific URL
    // which too would send chunks. does not matter for now.
    let videoURL: String
    let duration: Int
    let views: Int
    let likes: Int
    let uploader: String
    let uploadDate: String
}

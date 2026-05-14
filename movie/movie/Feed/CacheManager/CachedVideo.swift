import Foundation
import SwiftData

@Model
final class VideoCacheEntry {
    @Attribute(.unique) var id: String

    var remoteURL: String
    var localFileName: String?
    var lastAccessed: Date

    init(id: String, remoteURL: String, localFileName: String? = nil) {
        self.id = id
        self.remoteURL = remoteURL
        self.localFileName = localFileName
        self.lastAccessed = .now
    }
}

import Foundation

final class VideoURLResolver {
    func resolve(video: Video) async -> URL {
        guard let remote = URL(string: video.videoURL) else {
            fatalError("Invalid URL")
        }

        do {
            return try await VideoDiskCache.shared.loadOrDownload(
                id: video.id,
                remoteURL: remote
            )
        } catch {
            return remote // fallback
        }
    }
}

import Foundation

actor VideoDiskCache {
    static let shared = VideoDiskCache()

    private let folder: URL = {
        FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("videos")
    }()

    init() {
        try? FileManager.default.createDirectory(
            at: folder,
            withIntermediateDirectories: true
        )
    }

    func localURL(for id: String) -> URL {
        folder.appendingPathComponent("\(id).mp4")
    }

    func exists(id: String) -> Bool {
        FileManager.default.fileExists(atPath: localURL(for: id).path)
    }

    func loadOrDownload(
        id: String,
        remoteURL: URL
    ) async throws -> URL {
        let local = localURL(for: id)
        if FileManager.default.fileExists(atPath: local.path) {
            return local
        }
        let (temp, _) = try await URLSession.shared.download(from: remoteURL)
        try FileManager.default.moveItem(at: temp, to: local)

        return local
    }
}

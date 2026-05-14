import AVKit
import SwiftUI

struct CustomVideoPlayer: UIViewControllerRepresentable {
    let player: AVQueuePlayer

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()

        controller.player = player
        controller.showsPlaybackControls = false
        controller.videoGravity = .resizeAspectFill

        return controller
    }

    func updateUIViewController(
        _ controller: AVPlayerViewController,
        context: Context
    ) {
        controller.player = player
    }
}

struct VideoCell: View {
    let player: AVQueuePlayer?
    let isActive: Bool
    let video: Video

    var body: some View {
        ZStack {
            if let player, isActive {
                CustomVideoPlayer(player: player)
            } else {
                AsyncImage(url: URL(string: video.thumbnailURL))
            }
        }
    }
}

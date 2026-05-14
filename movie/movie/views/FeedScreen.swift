import AVKit
import SwiftUI

struct FeedScreen: View {
    @State private var feedViewModel = FeedViewModel()
    @State private var player = AVQueuePlayer()
    @State private var looper: AVPlayerLooper?
    @State private var activeVideoID: String?

    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                ForEach(feedViewModel.videos) { video in
                    ZStack(alignment: .bottom) {
                        VideoCell(
                            player: player,
                            isActive: activeVideoID == video.id,
                            video: video
                        )
                        // TODO: jank af but fine for now. need to track scroll
                        // position and compute stuff to be able to handle
                        // everything nicely
                        .onAppear {
                            guard activeVideoID != video.id else {
                                return
                            }

                            activeVideoID = video.id

                            Task {
                                await play(video)
                            }
                        }

                        LinearGradient(
                            colors: [
                                .clear,
                                .black.opacity(0.5),
                            ],
                            startPoint: .center,
                            endPoint: .bottom
                        )
                        .frame(height: 300)

                        VStack(alignment: .leading) {
                            Spacer()
                            // TODO: likes and stuff ig

                            HStack(alignment: .bottom) {
                                Image(systemName: "photo.fill")
                                    .foregroundStyle(.white)
                                    .padding(12)
                                    .background(.black.opacity(0.2))
                                    .clipShape(Circle())
                                    .shadow(
                                        color: .black.opacity(0.25),
                                        radius: 5,
                                        x: 0,
                                        y: 1
                                    )

                                Text("@\(video.uploader)")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                    .shadow(
                                        color: .black.opacity(0.8),
                                        radius: 8,
                                        x: 0,
                                        y: 2
                                    )
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 10)
                                    .frame(
                                        alignment: .leading
                                    )

                                Button {
                                } label: {
                                    Text("Follow")
                                        .font(.caption2)
                                        .fontWeight(.semibold)
                                        .frame(width: 40, height: 30)
                                        .padding(.horizontal, 20)
                                        .background(Color.pink)
                                        .foregroundColor(.white)
                                        .cornerRadius(50)
                                }

                                Spacer()
                            }

                            Text("posted on: \(video.uploadDate)")
                                .font(.caption)
                                .foregroundStyle(.white)
                                .padding(.horizontal, 10)
                                .frame(
                                    alignment: .leading
                                )

                            Text(video.description)
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .shadow(radius: 2)
                                .padding(.horizontal, 10)
                                .padding(.bottom, 10)
                                .frame(
                                    maxWidth: .infinity,
                                    alignment: .leading
                                )
                                .lineLimit(2)
                        }.padding(.bottom, 90)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .containerRelativeFrame(.vertical)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
        .task {
            await feedViewModel.loadFeed()
        }
    }

    private func play(_ video: Video) async {
        let url = await VideoURLResolver().resolve(video: video)

        let item = AVPlayerItem(url: url)

        player.pause()

        looper = nil
        player.removeAllItems()

        looper = AVPlayerLooper(
            player: player,
            templateItem: item
        )

        player.play()
    }
}

#Preview {
    FeedScreen()
}

import Foundation

struct MockFeedRepository: FeedRepository {
    func fetchFeed() async throws -> Feed {
        try await Task.sleep(for: .seconds(1))

        return Feed(feedRequest: [
            Video(
                id: "vid_001",
                title: "Morning Coffee Vibes",
                description: "A calm morning routine with coffee and sunlight.",
                thumbnailURL: "https://picsum.photos/seed/coffee/400/700",
                videoURL: "https://download.samplelib.com/mp4/sample-5s.mp4",
                duration: 5,
                views: 12453,
                likes: 842,
                uploader: "alpha_user_01",
                uploadDate: "2026-01-10"
            ),

            Video(
                id: "vid_002",
                title: "City Night Walk",
                description: "Walking through neon-lit streets at night.",
                thumbnailURL: "https://picsum.photos/seed/city/400/700",
                videoURL: "https://download.samplelib.com/mp4/sample-10s.mp4",
                duration: 10,
                views: 98321,
                likes: 12034,
                uploader: "beta_creator_22",
                uploadDate: "2026-01-12"
            ),

            Video(
                id: "vid_003",
                title: "Workout Motivation",
                description: "Quick home workout session.",
                thumbnailURL: "https://picsum.photos/seed/workout/400/700",
                videoURL: "https://download.samplelib.com/mp4/sample-15s.mp4",
                duration: 15,
                views: 55210,
                likes: 4301,
                uploader: "neo_films",
                uploadDate: "2026-01-15"
            ),

            Video(
                id: "vid_004",
                title: "Ocean Relaxation",
                description: "Relaxing ocean waves and ambient sound.",
                thumbnailURL: "https://picsum.photos/seed/ocean/400/700",
                videoURL: "https://filesamples.com/samples/video/mp4/sample_960x400_ocean_with_audio.mp4",
                duration: 20,
                views: 210004,
                likes: 98500,
                uploader: "daily_reels",
                uploadDate: "2026-01-18"
            ),

            Video(
                id: "vid_005",
                title: "Nature Escape",
                description: "Green forests and peaceful walking path.",
                thumbnailURL: "https://picsum.photos/seed/nature/400/700",
                videoURL: "https://filesamples.com/samples/video/mp4/sample_640x360.mp4",
                duration: 30,
                views: 33012,
                likes: 1200,
                uploader: "test_user_hd",
                uploadDate: "2026-01-20"
            ),
        ])
    }
}

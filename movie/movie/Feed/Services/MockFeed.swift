import Foundation

struct MockFeed: FeedStorage {
    func get() -> Feed {
        return Feed(feedRequest: [
            Video(
                videoId: "vid_001",
                title: "Morning Coffee Vibes",
                description: "A calm morning routine with coffee and sunlight.",
                thumbnail: "https://picsum.photos/seed/coffee/400/700",
                videoUrl: "https://download.samplelib.com/mp4/sample-5s.mp4",
                duration: 5,
                views: 12453,
                likes: 842,
                uploader: "alpha_user_01",
                uploadDate: "2026-01-10"
            ),

            Video(
                videoId: "vid_002",
                title: "City Night Walk",
                description: "Walking through neon-lit streets at night.",
                thumbnail: "https://picsum.photos/seed/city/400/700",
                videoUrl: "https://download.samplelib.com/mp4/sample-10s.mp4",
                duration: 10,
                views: 98321,
                likes: 12034,
                uploader: "beta_creator_22",
                uploadDate: "2026-01-12"
            ),

            Video(
                videoId: "vid_003",
                title: "Workout Motivation",
                description: "Quick home workout session.",
                thumbnail: "https://picsum.photos/seed/workout/400/700",
                videoUrl: "https://download.samplelib.com/mp4/sample-15s.mp4",
                duration: 15,
                views: 55210,
                likes: 4301,
                uploader: "neo_films",
                uploadDate: "2026-01-15"
            ),

            Video(
                videoId: "vid_004",
                title: "Ocean Relaxation",
                description: "Relaxing ocean waves and ambient sound.",
                thumbnail: "https://picsum.photos/seed/ocean/400/700",
                videoUrl: "https://filesamples.com/samples/video/mp4/sample_960x400_ocean_with_audio.mp4",
                duration: 20,
                views: 210004,
                likes: 98500,
                uploader: "daily_reels",
                uploadDate: "2026-01-18"
            ),

            Video(
                videoId: "vid_005",
                title: "Nature Escape",
                description: "Green forests and peaceful walking path.",
                thumbnail: "https://picsum.photos/seed/nature/400/700",
                videoUrl: "https://filesamples.com/samples/video/mp4/sample_640x360.mp4",
                duration: 30,
                views: 33012,
                likes: 1200,
                uploader: "test_user_hd",
                uploadDate: "2026-01-20"
            ),
        ])
    }
}

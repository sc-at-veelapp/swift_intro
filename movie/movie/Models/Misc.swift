struct AniListResponse: Codable {
    let data: PageContainer
}

struct PageContainer: Codable {
    let Page: MediaPage
}

struct MediaPage: Codable {
    let media: [Media]
}

struct Title: Codable, Hashable {
    let romaji: String?
}

struct CoverImage: Codable, Hashable {
    let large: String?
}

struct StartDate: Codable, Hashable {
    let year: Int?
}

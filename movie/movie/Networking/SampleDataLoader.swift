import Foundation

// MARK: - SampleData Decodable Structures (matching AniList JSON structure)

struct SampleDataResponse: Decodable {
    let data: SampleDataContent
}

struct SampleDataContent: Decodable {
    let Page: PageData
}

struct PageData: Decodable {
    let media: [MediaData]
}

struct MediaData: Decodable {
    let id: Int
    let title: TitleData?
    let description: String?
    let coverImage: CoverImageData?
    let staff: StaffConnectionData?
    let characterPreview: CharacterConnectionData?
    let averageScore: Int?
    let duration: Int?
    let studios: StudioConnectionData?
}

struct TitleData: Decodable {
    let romaji: String?
}

struct CoverImageData: Decodable {
    let large: String?
    let medium: String?
}

struct StaffConnectionData: Decodable {
    let edges: [StaffEdgeData]?
}

struct StaffEdgeData: Decodable {
    let role: String?
    let node: StaffNodeData?
}

struct StaffNodeData: Decodable {
    let id: Int?
    let name: NameData?
    let image: ImageData?
}

struct CharacterConnectionData: Decodable {
    let edges: [CharacterEdgeData]?
}

struct CharacterEdgeData: Decodable {
    let id: Int?
    let role: String?
    let node: CharacterNodeData?
    let voiceActors: [VoiceActorData]?
}

struct CharacterNodeData: Decodable {
    let id: Int?
    let name: NameData?
    let image: ImageData?
}

struct VoiceActorData: Decodable {
    let id: Int?
    let name: NameData?
    let languageV2: String?
    let language: String?
    let image: ImageData?

    enum CodingKeys: String, CodingKey {
        case id, name, image
        case languageV2 = "languageV2"
        case language
    }
}

struct NameData: Decodable {
    let userPreferred: String?
}

struct ImageData: Decodable {
    let large: String?
    let medium: String?
}

struct StudioConnectionData: Decodable {
    let edges: [StudioEdgeData]?
}

struct StudioEdgeData: Decodable {
    let node: StudioNodeData?
}

struct StudioNodeData: Decodable {
    let id: Int?
    let name: String?
}

// MARK: - Sample Data Loader

class SampleDataLoader {
    static func loadSampleData() throws -> SampleDataResponse {
        guard let url = Bundle.main.url(forResource: "SampleData", withExtension: "json") else {
            throw APIError.invalidURL
        }

        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try decoder.decode(SampleDataResponse.self, from: data)
    }

    static func convertToMovie(from mediaData: MediaData) -> Movie {
        let staff = mediaData.staff?.edges?.compactMap { edge -> StaffMember? in
            guard let node = edge?.node,
                  let id = node.id,
                  let name = node.name?.userPreferred
            else { return nil }
            return StaffMember(
                id: id,
                name: name,
                role: edge?.role,
                image: node.image?.large
            )
        }

        let characters = mediaData.characterPreview?.edges?.compactMap { edge -> Character? in
            guard let node = edge?.node,
                  let id = node.id ?? edge?.id,
                  let name = node.name?.userPreferred
            else { return nil }

            let voiceActors = edge?.voiceActors?.compactMap { actor -> VoiceActor? in
                guard let id = actor.id,
                      let name = actor.name?.userPreferred
                else { return nil }
                return VoiceActor(
                    id: id,
                    name: name,
                    language: actor.languageV2 ?? actor.language,
                    image: actor.image?.large
                )
            }

            return Character(
                id: id,
                name: name,
                role: edge?.role,
                image: node.image?.large,
                voiceActors: voiceActors
            )
        }

        return Movie(
            id: mediaData.id,
            title: mediaData.title?.romaji ?? "Unknown",
            description: mediaData.description,
            image: mediaData.coverImage?.medium ?? mediaData.coverImage?.large,
            averageScore: mediaData.averageScore,
            duration: mediaData.duration,
            studios: mediaData.studios?.edges?.compactMap { $0?.node?.name },
            staff: staff,
            characters: characters
        )
    }
}

struct CharacterConnection: Codable, Hashable {
    let edges: [CharacterEdge]
}

struct CharacterEdge: Codable, Hashable {
    let id: Int?
    let role: String?
    let voiceActors: [VoiceActor]
    let node: CharacterNode
}

struct CharacterNode: Codable, Hashable {
    let id: Int
    let name: CharacterName
    let image: CharacterImage?
}

struct CharacterName: Codable, Hashable {
    let userPreferred: String?
}

struct CharacterImage: Codable, Hashable {
    let large: String?
}

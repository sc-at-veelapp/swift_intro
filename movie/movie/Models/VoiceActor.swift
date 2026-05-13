struct VoiceActor: Codable, Hashable {
    let id: Int
    let name: VAName
    let language: String?
    let image: VAImage?
}

struct VAName: Codable, Hashable {
    let userPreferred: String?
}

struct VAImage: Codable, Hashable {
    let large: String?
}

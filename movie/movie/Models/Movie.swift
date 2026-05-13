import Foundation

struct Movie: Codable, Identifiable, Equatable, Hashable {
    let id: Int
    let title: String
    let description: String?
    let image: String?
    let averageScore: Int?
    let duration: Int?
    let studios: [String]?
    let staff: [StaffMember]?
    let characters: [Character]?

    enum CodingKeys: String, CodingKey {
        case id, title, description, image
        case averageScore, duration, studios, staff, characters
    }
}

struct StaffMember: Codable, Identifiable, Equatable, Hashable {
    let id: Int
    let name: String
    let role: String?
    let image: String?

    enum CodingKeys: String, CodingKey {
        case id, name, role, image
    }
}

struct Character: Codable, Identifiable, Equatable, Hashable {
    let id: Int
    let name: String
    let role: String?
    let image: String?
    let voiceActors: [VoiceActor]?

    enum CodingKeys: String, CodingKey {
        case id, name, role, image, voiceActors
    }
}

struct VoiceActor: Codable, Identifiable, Equatable, Hashable {
    let id: Int
    let name: String
    let language: String?
    let image: String?

    enum CodingKeys: String, CodingKey {
        case id, name, language, image
    }
}

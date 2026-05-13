struct StudioConnection: Codable, Hashable {
    let edges: [StudioEdge]
}

struct StudioEdge: Codable, Hashable {
    let isMain: Bool?
    let node: StudioNode
}

struct StudioNode: Codable, Hashable {
    let id: Int
    let name: String
}

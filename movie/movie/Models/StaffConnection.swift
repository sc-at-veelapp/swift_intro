struct StaffConnection: Codable, Hashable {
    let edges: [StaffEdge]
}

struct StaffEdge: Codable, Hashable {
    let role: String?
    let node: StaffNode
}

struct StaffNode: Codable, Hashable {
    let id: Int
    let name: StaffName
}

struct StaffName: Codable, Hashable {
    let userPreferred: String?
}

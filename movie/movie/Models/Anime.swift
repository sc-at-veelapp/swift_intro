struct Media: Codable, Identifiable, Hashable {
    let id: Int
    let title: Title
    let description: String?
    let averageScore: Int?
    let duration: Int?

    let coverImage: CoverImage
    let staff: StaffConnection?
    let characterPreview: CharacterConnection?
    let startDate: StartDate?
    let studios: StudioConnection?
}

import Foundation
import Observation

@Observable
class FavoritesViewModel {
    // read-only outside but mutable inside (via save in this case0
    //      |
    //      v
    private(set) var favoriteIDs: Set<String> = []

    private let service: FavoriteStorage

    init(service: FavoriteStorage = DefaultFavoriteStorage()) {
        self.service = service
    }

    func load() {
        favoriteIDs = service.load()
    }

    private func save() {
        service.save(favoriteIDs: favoriteIDs)
    }

    func toggleFavorite(filmID: String) {
        if favoriteIDs.contains(filmID) {
            favoriteIDs.remove(filmID)
        } else {
            favoriteIDs.insert(filmID)
        }
        save()
    }

    func isFavorite(filmID: String) -> Bool {
        favoriteIDs.contains(filmID)
    }
}

import AnilistQL
import Apollo
import Combine
import Foundation

struct AniListService: MovieService {
    func fetchFilms(page: Int = 1, perPage: Int = 10) async throws -> [Movie] {
        let page: GraphQLNullable<Int32> = .some(Int32(page))
        let perPage: GraphQLNullable<Int32> = .some(Int32(perPage))

        let result = try await Network.shared.client.fetch(
            query: GetAnimeQuery(page: page, perPage: perPage)
        )

        let media = result.data?.page?.media ?? []

        return media.compactMap { item in
            guard let id = item?.id,
                let title = item?.title?.english
            else { return nil }

            return Movie(
                id: id,
                title: title,
                description: item?.description,
                image: item?.coverImage?.medium,
                averageScore: item?.averageScore,
                duration: item?.duration,
                studios: nil,
                staff: nil,
                characters: nil
            )
        }
    }

    func fetchMovieDetail(id: Int32) async throws -> Movie {
        let result = try await Network.shared.client.fetch(
            query: GetAnimeDetailQuery(id: id)
        )

        guard let media = result.data?.media else {
            throw APIError.missingData
        }

        let staff = media.staff?.edges?.compactMap { edge -> StaffMember? in
            guard let node = edge?.node,
                let id: Int? = node.id,
                let name = node.name?.userPreferred
            else { return nil }
            return StaffMember(
                id: id!,
                name: name,
                role: edge?.role,
                image: node.image?.large
            )
        }

        let characters = media.characters?.edges?.compactMap {
            edge -> Character? in
            guard let node = edge?.node,
                let id: Int? = node.id,
                let name = node.name?.userPreferred
            else { return nil }

            let voiceActors = (edge?.voiceActors ?? []).compactMap {
                actor -> VoiceActor? in
                guard let actor,
                    let id: Int? = actor.id,
                    let name = actor.name?.userPreferred
                else {
                    return nil
                }

                return VoiceActor(
                    id: id!,
                    name: name,
                    language: actor.languageV2,
                    image: actor.image?.large
                )
            }

            return Character(
                id: id!,
                name: name,
                role: edge?.role?.value?.rawValue,
                image: node.image?.large,
                voiceActors: voiceActors
            )
        }

        return Movie(
            id: media.id,
            title: media.title?.romaji ?? "Unknown",
            description: media.description,
            image: media.coverImage?.large,
            averageScore: media.averageScore,
            duration: media.duration,
            studios: media.studios?.edges?.compactMap { $0?.node?.name },
            staff: staff,
            characters: characters
        )
    }

    func searchFilm(for searchTerm: String, page: Int = 1, perPage: Int = 10)
        async throws -> [Movie]
    {
        let result = try await Network.shared.client.fetch(
            query: SearchAnimeQuery(
                search: .some(searchTerm),
                page: .some(Int32(page)),
                perPage: .some(Int32(perPage))
            )
        )

        let media = result.data?.page?.media ?? []

        return media.compactMap { item in
            guard let id = item?.id,
                let title = item?.title?.english
            else { return nil }

            return Movie(
                id: id,
                title: title,
                description: item?.description,
                image: item?.coverImage?.medium,
                averageScore: item?.averageScore,
                duration: item?.duration,
                studios: nil,
                staff: nil,
                characters: nil
            )
        }
    }
}

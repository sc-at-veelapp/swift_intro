// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

nonisolated public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == AnilistQL.SchemaMetadata {}

nonisolated public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == AnilistQL.SchemaMetadata {}

nonisolated public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == AnilistQL.SchemaMetadata {}

nonisolated public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == AnilistQL.SchemaMetadata {}

nonisolated public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  private static let objectTypeMap: [String: ApolloAPI.Object] = [
    "Character": AnilistQL.Objects.Character,
    "CharacterConnection": AnilistQL.Objects.CharacterConnection,
    "CharacterEdge": AnilistQL.Objects.CharacterEdge,
    "CharacterImage": AnilistQL.Objects.CharacterImage,
    "CharacterName": AnilistQL.Objects.CharacterName,
    "Media": AnilistQL.Objects.Media,
    "MediaCoverImage": AnilistQL.Objects.MediaCoverImage,
    "MediaTitle": AnilistQL.Objects.MediaTitle,
    "Page": AnilistQL.Objects.Page,
    "PageInfo": AnilistQL.Objects.PageInfo,
    "Query": AnilistQL.Objects.Query,
    "Staff": AnilistQL.Objects.Staff,
    "StaffConnection": AnilistQL.Objects.StaffConnection,
    "StaffEdge": AnilistQL.Objects.StaffEdge,
    "StaffImage": AnilistQL.Objects.StaffImage,
    "StaffName": AnilistQL.Objects.StaffName,
    "Studio": AnilistQL.Objects.Studio,
    "StudioConnection": AnilistQL.Objects.StudioConnection,
    "StudioEdge": AnilistQL.Objects.StudioEdge
  ]

  @_spi(Execution) public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    objectTypeMap[typename]
  }
}

nonisolated public enum Objects {}
nonisolated public enum Interfaces {}
nonisolated public enum Unions {}

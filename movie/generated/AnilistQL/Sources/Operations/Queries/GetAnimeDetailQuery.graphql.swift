// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct GetAnimeDetailQuery: GraphQLQuery {
  public static let operationName: String = "GetAnimeDetail"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetAnimeDetail($id: Int!) { Media(id: $id, type: ANIME) { __typename id title { __typename romaji } description averageScore duration coverImage { __typename large } studios(isMain: true) { __typename edges { __typename node { __typename id name } } } staff(sort: [RELEVANCE, ID]) { __typename edges { __typename role node { __typename id name { __typename userPreferred } image { __typename large } } } } characters(sort: [ROLE, RELEVANCE, ID], perPage: 6) { __typename edges { __typename id role node { __typename id name { __typename userPreferred } image { __typename large } } voiceActors(language: JAPANESE, sort: [RELEVANCE, ID]) { __typename id name { __typename userPreferred } languageV2 image { __typename large } } } } } }"#
    ))

  public var id: Int32

  public init(id: Int32) {
    self.id = id
  }

  @_spi(Unsafe) public var __variables: Variables? { ["id": id] }

  nonisolated public struct Data: AnilistQL.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnilistQL.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("Media", Media?.self, arguments: [
        "id": .variable("id"),
        "type": "ANIME"
      ]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      GetAnimeDetailQuery.Data.self
    ] }

    /// Media query
    public var media: Media? { __data["Media"] }

    /// Media
    ///
    /// Parent Type: `Media`
    nonisolated public struct Media: AnilistQL.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnilistQL.Objects.Media }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Int.self),
        .field("title", Title?.self),
        .field("description", String?.self),
        .field("averageScore", Int?.self),
        .field("duration", Int?.self),
        .field("coverImage", CoverImage?.self),
        .field("studios", Studios?.self, arguments: ["isMain": true]),
        .field("staff", Staff?.self, arguments: ["sort": ["RELEVANCE", "ID"]]),
        .field("characters", Characters?.self, arguments: [
          "sort": ["ROLE", "RELEVANCE", "ID"],
          "perPage": 6
        ]),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        GetAnimeDetailQuery.Data.Media.self
      ] }

      /// The id of the media
      public var id: Int { __data["id"] }
      /// The official titles of the media in various languages
      public var title: Title? { __data["title"] }
      /// Short description of the media's story and characters
      public var description: String? { __data["description"] }
      /// A weighted average score of all the user's scores of the media
      public var averageScore: Int? { __data["averageScore"] }
      /// The general length of each anime episode in minutes
      public var duration: Int? { __data["duration"] }
      /// The cover images of the media
      public var coverImage: CoverImage? { __data["coverImage"] }
      /// The companies who produced the media
      public var studios: Studios? { __data["studios"] }
      /// The staff who produced the media
      public var staff: Staff? { __data["staff"] }
      /// The characters in the media
      public var characters: Characters? { __data["characters"] }

      /// Media.Title
      ///
      /// Parent Type: `MediaTitle`
      nonisolated public struct Title: AnilistQL.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnilistQL.Objects.MediaTitle }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("romaji", String?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          GetAnimeDetailQuery.Data.Media.Title.self
        ] }

        /// The romanization of the native language title
        public var romaji: String? { __data["romaji"] }
      }

      /// Media.CoverImage
      ///
      /// Parent Type: `MediaCoverImage`
      nonisolated public struct CoverImage: AnilistQL.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnilistQL.Objects.MediaCoverImage }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("large", String?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          GetAnimeDetailQuery.Data.Media.CoverImage.self
        ] }

        /// The cover image url of the media at a large size
        public var large: String? { __data["large"] }
      }

      /// Media.Studios
      ///
      /// Parent Type: `StudioConnection`
      nonisolated public struct Studios: AnilistQL.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnilistQL.Objects.StudioConnection }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("edges", [Edge?]?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          GetAnimeDetailQuery.Data.Media.Studios.self
        ] }

        public var edges: [Edge?]? { __data["edges"] }

        /// Media.Studios.Edge
        ///
        /// Parent Type: `StudioEdge`
        nonisolated public struct Edge: AnilistQL.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnilistQL.Objects.StudioEdge }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("node", Node?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            GetAnimeDetailQuery.Data.Media.Studios.Edge.self
          ] }

          public var node: Node? { __data["node"] }

          /// Media.Studios.Edge.Node
          ///
          /// Parent Type: `Studio`
          nonisolated public struct Node: AnilistQL.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnilistQL.Objects.Studio }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", Int.self),
              .field("name", String.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              GetAnimeDetailQuery.Data.Media.Studios.Edge.Node.self
            ] }

            /// The id of the studio
            public var id: Int { __data["id"] }
            /// The name of the studio
            public var name: String { __data["name"] }
          }
        }
      }

      /// Media.Staff
      ///
      /// Parent Type: `StaffConnection`
      nonisolated public struct Staff: AnilistQL.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnilistQL.Objects.StaffConnection }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("edges", [Edge?]?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          GetAnimeDetailQuery.Data.Media.Staff.self
        ] }

        public var edges: [Edge?]? { __data["edges"] }

        /// Media.Staff.Edge
        ///
        /// Parent Type: `StaffEdge`
        nonisolated public struct Edge: AnilistQL.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnilistQL.Objects.StaffEdge }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("role", String?.self),
            .field("node", Node?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            GetAnimeDetailQuery.Data.Media.Staff.Edge.self
          ] }

          /// The role of the staff member in the production of the media
          public var role: String? { __data["role"] }
          public var node: Node? { __data["node"] }

          /// Media.Staff.Edge.Node
          ///
          /// Parent Type: `Staff`
          nonisolated public struct Node: AnilistQL.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnilistQL.Objects.Staff }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", Int.self),
              .field("name", Name?.self),
              .field("image", Image?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              GetAnimeDetailQuery.Data.Media.Staff.Edge.Node.self
            ] }

            /// The id of the staff member
            public var id: Int { __data["id"] }
            /// The names of the staff member
            public var name: Name? { __data["name"] }
            /// The staff images
            public var image: Image? { __data["image"] }

            /// Media.Staff.Edge.Node.Name
            ///
            /// Parent Type: `StaffName`
            nonisolated public struct Name: AnilistQL.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnilistQL.Objects.StaffName }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("userPreferred", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                GetAnimeDetailQuery.Data.Media.Staff.Edge.Node.Name.self
              ] }

              /// The currently authenticated users preferred name language. Default romaji for non-authenticated
              public var userPreferred: String? { __data["userPreferred"] }
            }

            /// Media.Staff.Edge.Node.Image
            ///
            /// Parent Type: `StaffImage`
            nonisolated public struct Image: AnilistQL.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnilistQL.Objects.StaffImage }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("large", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                GetAnimeDetailQuery.Data.Media.Staff.Edge.Node.Image.self
              ] }

              /// The person's image of media at its largest size
              public var large: String? { __data["large"] }
            }
          }
        }
      }

      /// Media.Characters
      ///
      /// Parent Type: `CharacterConnection`
      nonisolated public struct Characters: AnilistQL.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnilistQL.Objects.CharacterConnection }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("edges", [Edge?]?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          GetAnimeDetailQuery.Data.Media.Characters.self
        ] }

        public var edges: [Edge?]? { __data["edges"] }

        /// Media.Characters.Edge
        ///
        /// Parent Type: `CharacterEdge`
        nonisolated public struct Edge: AnilistQL.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnilistQL.Objects.CharacterEdge }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("role", GraphQLEnum<AnilistQL.CharacterRole>?.self),
            .field("node", Node?.self),
            .field("voiceActors", [VoiceActor?]?.self, arguments: [
              "language": "JAPANESE",
              "sort": ["RELEVANCE", "ID"]
            ]),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            GetAnimeDetailQuery.Data.Media.Characters.Edge.self
          ] }

          /// The id of the connection
          public var id: Int? { __data["id"] }
          /// The characters role in the media
          public var role: GraphQLEnum<AnilistQL.CharacterRole>? { __data["role"] }
          public var node: Node? { __data["node"] }
          /// The voice actors of the character
          public var voiceActors: [VoiceActor?]? { __data["voiceActors"] }

          /// Media.Characters.Edge.Node
          ///
          /// Parent Type: `Character`
          nonisolated public struct Node: AnilistQL.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnilistQL.Objects.Character }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", Int.self),
              .field("name", Name?.self),
              .field("image", Image?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              GetAnimeDetailQuery.Data.Media.Characters.Edge.Node.self
            ] }

            /// The id of the character
            public var id: Int { __data["id"] }
            /// The names of the character
            public var name: Name? { __data["name"] }
            /// Character images
            public var image: Image? { __data["image"] }

            /// Media.Characters.Edge.Node.Name
            ///
            /// Parent Type: `CharacterName`
            nonisolated public struct Name: AnilistQL.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnilistQL.Objects.CharacterName }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("userPreferred", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                GetAnimeDetailQuery.Data.Media.Characters.Edge.Node.Name.self
              ] }

              /// The currently authenticated users preferred name language. Default romaji for non-authenticated
              public var userPreferred: String? { __data["userPreferred"] }
            }

            /// Media.Characters.Edge.Node.Image
            ///
            /// Parent Type: `CharacterImage`
            nonisolated public struct Image: AnilistQL.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnilistQL.Objects.CharacterImage }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("large", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                GetAnimeDetailQuery.Data.Media.Characters.Edge.Node.Image.self
              ] }

              /// The character's image of media at its largest size
              public var large: String? { __data["large"] }
            }
          }

          /// Media.Characters.Edge.VoiceActor
          ///
          /// Parent Type: `Staff`
          nonisolated public struct VoiceActor: AnilistQL.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnilistQL.Objects.Staff }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", Int.self),
              .field("name", Name?.self),
              .field("languageV2", String?.self),
              .field("image", Image?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              GetAnimeDetailQuery.Data.Media.Characters.Edge.VoiceActor.self
            ] }

            /// The id of the staff member
            public var id: Int { __data["id"] }
            /// The names of the staff member
            public var name: Name? { __data["name"] }
            /// The primary language of the staff member. Current values: Japanese, English, Korean, Italian, Spanish, Portuguese, French, German, Hebrew, Hungarian, Chinese, Arabic, Filipino, Catalan, Finnish, Turkish, Dutch, Swedish, Thai, Tagalog, Malaysian, Indonesian, Vietnamese, Nepali, Hindi, Urdu
            public var languageV2: String? { __data["languageV2"] }
            /// The staff images
            public var image: Image? { __data["image"] }

            /// Media.Characters.Edge.VoiceActor.Name
            ///
            /// Parent Type: `StaffName`
            nonisolated public struct Name: AnilistQL.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnilistQL.Objects.StaffName }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("userPreferred", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                GetAnimeDetailQuery.Data.Media.Characters.Edge.VoiceActor.Name.self
              ] }

              /// The currently authenticated users preferred name language. Default romaji for non-authenticated
              public var userPreferred: String? { __data["userPreferred"] }
            }

            /// Media.Characters.Edge.VoiceActor.Image
            ///
            /// Parent Type: `StaffImage`
            nonisolated public struct Image: AnilistQL.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnilistQL.Objects.StaffImage }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("large", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                GetAnimeDetailQuery.Data.Media.Characters.Edge.VoiceActor.Image.self
              ] }

              /// The person's image of media at its largest size
              public var large: String? { __data["large"] }
            }
          }
        }
      }
    }
  }
}

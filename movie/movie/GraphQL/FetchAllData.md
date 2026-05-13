```graphql
query {
  Page(page: 1, perPage: 10) {
    media(type: ANIME, format: MOVIE, sort: POPULARITY_DESC) {
      id
      title {
        romaji
      }
      coverImage {
        large
      }
      description

      staff {
        edges {
          role
          node {
            id
            name {
              userPreferred
            }
          }
        }
      }
      characterPreview: characters(perPage: 6, sort: [ROLE, RELEVANCE, ID]) {
        edges {
          id
          role
          name
          voiceActors(language: JAPANESE, sort: [RELEVANCE, ID]) {
            id
            name {
              userPreferred
            }
            language: languageV2
            image {
              large
            }
          }
          node {
            id
            name {
              userPreferred
            }
            image {
              large
            }
          }
        }
      }
      startDate {
        year
      }

      averageScore
      duration

      studios {
        edges {
          isMain
          node {
            id
            name
          }
        }
      }
    }
  }
}
```

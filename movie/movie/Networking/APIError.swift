import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case invalidResponse
    case missingData
    case decoding(Error)
    case networkError(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL is invalid"

        case .invalidResponse:
            return "Invalid response from server"

        case .missingData:
            return "Required data was missing"

        case .decoding(let error):
            return "Failed to decode response: \(error.localizedDescription)"

        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        }
    }
}

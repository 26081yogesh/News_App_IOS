
import Foundation
import SwiftUI

enum Errors: LocalizedError {
    case invalidUrl
    case unknown
    case requestFailed(statusCode: Int)
    case decodingFailed
    case fetchingFailed

    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "Invalid URL"
        case .unknown:
            return "Unknown Error"
        case let .requestFailed(statusCode):
            return "Request failed with status code \(statusCode)"
        case .decodingFailed:
            return "Decoding Failed"
        case .fetchingFailed:
            return "Fetching Failed"
        default:
            return "Unknown Error"
        }
    }
}

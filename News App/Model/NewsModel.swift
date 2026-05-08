import Foundation

// MARK: - News Model

struct NewsModel: Codable {
    let articles: [Article]
}

// MARK: - Article

struct Article: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
    let content: String
    let url: String
    let image: String
    let publishedAt: Date
}

// MARK: - Source

struct Source: Codable {
    let name: String
    let url: String
}

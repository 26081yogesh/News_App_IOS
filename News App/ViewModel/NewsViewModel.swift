import Foundation

@Observable
class NewsViewModel {
    var news: [Article] = []
    var isLoading: Bool = false

    private let apiKey = "API KEY"

    func fetchNewsData() async throws -> NewsModel {
        let urlString = "https://gnews.io/api/v4/search?q=Google&lang=en&max=20&apikey=\(apiKey)"

        guard let url = URL(string: urlString) else {
            throw Errors.invalidUrl
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw Errors.unknown
        }

        guard httpResponse.statusCode == 200 else {
            print(httpResponse.statusCode)
            throw Errors.requestFailed(statusCode: httpResponse.statusCode)
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        do {
            return try decoder.decode(NewsModel.self, from: data)
        } catch {
            throw Errors.decodingFailed
        }
    }

    @MainActor
    func fetch() async throws {
        print("Called Fetch Function")
        do {
            let response = try await fetchNewsData()
            news = response.articles
        } catch {
            throw Errors.fetchingFailed
        }
    }
}

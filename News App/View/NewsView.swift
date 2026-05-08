import SwiftUI

struct NewsView: View {

    @State private var newsViewModel = NewsViewModel()
    @State private var darkMode: Bool = false

    var body: some View {

        NavigationStack {

            ScrollView(showsIndicators: false) {

                LazyVStack(spacing: 24) {

                    ForEach(newsViewModel.news) { article in

                        NewsCardView(
                            article: article,
                            darkMode: darkMode
                        )
                    }
                }
                .padding(.vertical)
            }
            .background(Color(.systemGroupedBackground))

            .navigationTitle("Top News")

            .toolbar {

                ToolbarItem(placement: .topBarTrailing) {

                    Button {

                        darkMode.toggle()

                    } label: {

                        Image(
                            systemName:
                                darkMode
                            ? "sun.max.fill"
                            : "moon.fill"
                        )
                    }
                }
            }
        }
        .preferredColorScheme(
            darkMode ? .dark : .light
        )

        .task {
            try? await newsViewModel.fetch()
        }
    }
}

#Preview {
    NewsView()
}

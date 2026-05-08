import SwiftUI

struct NewsCardView: View {

    let article: Article
    let darkMode: Bool

    var body: some View {

        VStack(alignment: .leading, spacing: 0) {

            AsyncImage(
                url: URL(string: article.image)
            ) { image in

                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 240)
                    .frame(maxWidth: .infinity)
                    .clipped()

            } placeholder: {

                ProgressView()
                    .frame(height: 240)
                    .frame(maxWidth: .infinity)
            }

            VStack(alignment: .leading, spacing: 14) {

                Text(article.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .lineLimit(3)

                Text(article.description)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .lineLimit(3)

                HStack {

                    Text(article.publishedAt, style: .date)
                        .font(.caption)
                        .foregroundStyle(.gray)

                    Spacer()

                    if let url = URL(string: article.url) {

                        Link(destination: url) {

                            HStack(spacing: 6) {

                                Text("Read More")

                                Image(systemName: "arrow.up.right")
                            }
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(Capsule())
                        }
                    }
                }
            }
            .padding(18)
        }
        .background(
            Color(uiColor: .secondarySystemBackground)
        )

        .clipShape(
            RoundedRectangle(
                cornerRadius: 28,
                style: .continuous
            )
        )

        .overlay(

            RoundedRectangle(cornerRadius: 28)

                .stroke(
                    darkMode
                    ? Color.white.opacity(0.08)
                    : Color.clear,
                    lineWidth: 1
                )
        )

        .shadow(
            color: Color.black.opacity(
                darkMode ? 0.3 : 0.08
            ),
            radius: 10,
            x: 0,
            y: 5
        )

        .padding(.horizontal)
    }
}

//
// Copyright © Tandem 2025. All rights reserved.
//

import SwiftUI

struct AuthorView: View {
    let name: String
    let email: String
    let commentId: Int

    private var authorLabel: String {
        if email.isEmpty { return name.isEmpty ? "Anonymous" : name }
        return name.isEmpty ? email : "\(name) – \(email)"
    }

    private var photoURL: URL? {
        guard commentId % 2 == 0 else { return nil }
        return URL(string: "https://picsum.photos/300/300?lock=\(commentId)")
    }

    var body: some View {
        HStack(spacing: 10) {
            if let photoURL {
                AsyncImage(url: photoURL) { phase in
                    switch phase {
                    case .success(let image):
                        image.resizable().scaledToFill()
                    case .failure:
                        Color.gray.opacity(0.2)
                    case .empty:
                        ProgressView()
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(width: 44, height: 44)
                .clipShape(Circle())
            }
            VStack(alignment: .leading, spacing: 2) {
                Text("by")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                Text(authorLabel)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview {
    AuthorView(name: "Max Mustermann", email: "max@example.com", commentId: 1)
    AuthorView(name: "Jane Doe", email: "", commentId: 2)
}

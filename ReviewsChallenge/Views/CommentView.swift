//
// Copyright © 2026 Tandem. All rights reserved.
//

import SwiftUI

struct CommentView: View {
    let comment: Comment

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            if !comment.body.isEmpty {
                Text(comment.body)
                    .font(.body)
                    .foregroundStyle(.primary)
            }
            AuthorView(name: comment.name, email: comment.email, commentId: comment.id)
        }
    }
}

#Preview {
    CommentView(
        comment: Comment(
            postId: 1,
            id: 1,
            name: "Jane Doe",
            email: "jane@example.com",
            body: "This is a comment body."
        )
    )
}

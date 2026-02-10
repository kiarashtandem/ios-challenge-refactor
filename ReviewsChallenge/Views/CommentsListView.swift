//
//  CommentsListView.swift
//  ReviewsChallenge
//

import SwiftUI

public struct CommentsListView: View {
    var comments: [Comment]
    let lastRowHasAppeared: () -> Void

    public var body: some View {
        List(comments, id: \.postId) { comment in
            CommentView(comment: comment)
                .onAppear {
                    if comments.last?.id == comment.id {
                        lastRowHasAppeared()
                    }
                }
        }
    }
}

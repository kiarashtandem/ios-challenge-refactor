//
// Copyright © 2026 Tandem. All rights reserved.
//

import Foundation

/// JSONPlaceholder comments API (free, no key): https://jsonplaceholder.typicode.com
enum CommentsAPI {
    static let baseURLString = "https://jsonplaceholder.typicode.com/comments"
    static let pageSize = 5

    static func commentsURL(postId: Int) -> URL? {
        URL(string: "\(baseURLString)?postId=\(postId)")
    }

    /// Post ID for a given page index (0-based). Use for pagination.
    static func postId(forPageIndex pageIndex: Int) -> Int {
        min(pageIndex + 1, 100)
    }
}

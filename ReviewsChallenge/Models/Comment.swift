//
// Copyright © 2026 Tandem. All rights reserved.
//

import Foundation

/// Model for JSONPlaceholder comments API: https://jsonplaceholder.typicode.com/comments
struct Comment: Codable, Equatable, Hashable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

//
//  Array+Unique.swift
//  ReviewsChallenge
//
//  Created by Joseph El Mallah on 28.10.2024.
//

import Foundation

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}

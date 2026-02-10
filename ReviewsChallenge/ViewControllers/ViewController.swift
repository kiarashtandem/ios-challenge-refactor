//
// Copyright © Tandem 2025. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    var comments: [Comment] = []
    var networkClient: NetworkClient = {
        let networkClient = NetworkClient()
        networkClient.jsonDecoder = JSONDecoder()
        return networkClient
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Comments"
        fetchComments()
    }

    func fetchComments() {
        let pageIndex = comments.count / CommentsAPI.pageSize
        let postId = CommentsAPI.postId(forPageIndex: pageIndex)
        let url = CommentsAPI.commentsURL(postId: postId)!

        _ = networkClient.run(
            URLRequest(url: url)
        ) { (result: Result<[Comment], NetworkError>) in
            switch result {
            case let .success(newComments):
                self.comments.append(contentsOf: newComments)
                // Due to a bug in the API, duplicated comments may be returned.
                self.comments = self.comments.uniqued()
            case let .failure(error):
                print(error)
            }

            self.addCommentsViewController()
        }
    }

    func addCommentsViewController() {
        let hostingController = UIHostingController(
            rootView: CommentsListView(
                comments: comments,
                lastRowHasAppeared: { [weak self] in
                    self?.fetchComments()
                }
            )
        )

        addChild(hostingController)
        if let view = viewIfLoaded {
            view.addSubview(hostingController.view)
            hostingController.view.frame = view.bounds
            hostingController.view.pinEdges(to: view)
        }

        hostingController.didMove(toParent: self)
    }
}

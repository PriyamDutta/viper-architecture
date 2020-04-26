//
//  PostListProtocol.swift
//  viper-example
//
//  Created by Priyam Dutta on 26/04/20.
//  Copyright © 2020 Priyam Dutta. All rights reserved.
//

import UIKit

protocol PostListToPresenterProtocol: class {
    var view: PostListViewProtocol? { get set }
    var interactor: PostListPresenterToInteractorProtocol? { get set }
    var wireframe: PostListWireFrameProtocol? { get set }
    // View to Presenter
    func viewDidLoad()
    func showPostDetail(_ post: PostModel)
}

protocol PostListViewProtocol: class {
    var presenter: PostListToPresenterProtocol? { get set }
    // Presenter to View
    func showPosts(_ posts: [PostModel])
    func setPostSelected(_ post: PostModel)
    func showLoading()
    func hideLoading()
    func showError()
}

protocol PostListPresenterToInteractorProtocol: class {
    var presenter: PostListInteractorToPresenterProtocol? { get set }
    var networkManager: PostListNetworkInputProtocol? { get set }
    // Presenter to Interactor
    func retrivePosts()
}

protocol PostListInteractorToPresenterProtocol: class {
    // Interactor to Presenter
    func didReceivePosts(_ result:  Result<[PostModel], Error>)
}

protocol PostListNetworkInputProtocol: class {
    var outputRequestManager: PostListNetworkOutputProtocol? { get set }
    // Interactor to Datamanager
    func retrivePosts()
}

protocol PostListInteractorToEntityProtocol: class {
    func setPostSelected(_ post: PostModel)
}

protocol PostListWireFrameProtocol: class {
    var presenter: PostListWireFrameToPresenterProtocol? { get set }
    static func createPostListModule() -> UIViewController
    // Presenter to Router
    func showPostDetailView(fromView view: PostListViewProtocol, withPost post: PostModel)
}

protocol PostListWireFrameToPresenterProtocol: class {
    // Router to Presenter
    func setPostSelected(_ post: PostModel)
}

protocol PostListNetworkOutputProtocol: class {
    func onReceivedResponse(_ result: Result<[PostModel], Error>)
}

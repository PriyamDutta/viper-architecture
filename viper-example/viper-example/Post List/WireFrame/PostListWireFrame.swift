//
//  PostListWireFrame.swift
//  viper-example
//
//  Created by Priyam Dutta on 26/04/20.
//  Copyright © 2020 Priyam Dutta. All rights reserved.
//

import UIKit

final class PostListWireFrame: PostListWireFrameProtocol {
    
    var presenter: PostListWireFrameToPresenterProtocol?
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createPostListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "PostsNavigationController")
        guard let view = navController.children.first as? PostListView else { return UIViewController() }
        let presenter: PostListToPresenterProtocol & PostListInteractorToPresenterProtocol & PostListWireFrameToPresenterProtocol = PostListPresenter()
        let interactor: PostListPresenterToInteractorProtocol & PostListNetworkOutputProtocol = PostListInteractor()
        let wireFrame: PostListWireFrameProtocol = PostListWireFrame()
        let networkManager: PostListNetworkInputProtocol = PostListNetworkManager()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = wireFrame
        presenter.interactor = interactor
        interactor.networkManager = networkManager
        interactor.presenter = presenter
        wireFrame.presenter = presenter
        networkManager.outputRequestManager = interactor
        
        return navController
    }
    
    func showPostDetailView(fromView view: PostListViewProtocol, withPost post: PostModel) {
        let postDetailView = PostDetailWireFrame.createPostDetailModule(withPost: post, delegate: self)
        if let navController = (view as? UIViewController)?.navigationController {
            navController.pushViewController(postDetailView, animated: true)
        }
        print("Goto details")
    }
}

extension PostListWireFrame: PostListDetailModeuleDelegate {
    func onSetPostSelected(forPost post: PostModel) {
        presenter?.setPostSelected(post)
    }
}

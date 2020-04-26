//
//  PostListPresenter.swift
//  viper-example
//
//  Created by Priyam Dutta on 26/04/20.
//  Copyright © 2020 Priyam Dutta. All rights reserved.
//

import Foundation

final class PostListPresenter: PostListToPresenterProtocol {
    var view: PostListViewProtocol?
    var interactor: PostListPresenterToInteractorProtocol?
    var wireframe: PostListWireFrameProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrivePosts()
    }
    
    func showPostDetail(_ post: PostModel) {
        wireframe?.showPostDetailView(fromView: view!, withPost: post)
    }
}

extension PostListPresenter: PostListInteractorToPresenterProtocol {
    
    func didReceivePosts(_ result: Result<[PostModel], Error>) {
        view?.hideLoading()
        switch result {
        case .success(let posts):
            view?.showPosts(posts)
        case .failure(_):
            view?.showError()
        }
    }
}

extension PostListPresenter: PostListWireFrameToPresenterProtocol {
    
    func setPostSelected(_ post: PostModel) {
        view?.setPostSelected(post)
    }
}

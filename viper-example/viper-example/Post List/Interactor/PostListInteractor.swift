//
//  PostListInteractor.swift
//  viper-example
//
//  Created by Priyam Dutta on 26/04/20.
//  Copyright © 2020 Priyam Dutta. All rights reserved.
//

import Foundation

final class PostListInteractor: PostListPresenterToInteractorProtocol {
    var networkManager: PostListNetworkInputProtocol?
    weak var presenter: PostListInteractorToPresenterProtocol?
    
    func retrivePosts() {
        networkManager?.retrivePosts()
    }
}

extension PostListInteractor: PostListNetworkOutputProtocol {
    func onReceivedResponse(_ result: Result<[PostModel], Error>) {
        presenter?.didReceivePosts(result)
    }
}

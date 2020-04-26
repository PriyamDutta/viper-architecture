//
//  PostDetailPresenter.swift
//  viper-example
//
//  Created by Priyam Dutta on 26/04/20.
//  Copyright © 2020 Priyam Dutta. All rights reserved.
//

import Foundation

final class PostDetailPresenter: PostDetailViewToPresenterProtocol {
    
    weak var view: PostDetailViewProtocol?
    var wireFrame: PostDetailWireFrameProtocol?
    var post: PostModel?
    
    func viewDidLoad() {
        if let post = post {
            view?.showPostDetail(forPost: post)
        }
    }
    
    func onSetPostSelected(forPost post: PostModel) {
        wireFrame?.moduleDelegate?.onSetPostSelected(forPost: post)
    }
    
    func dismissController(completion: @escaping () -> Void) {
        guard let view = view else { return }
        wireFrame?.dismissController(view: view, completion: completion)
    }
}

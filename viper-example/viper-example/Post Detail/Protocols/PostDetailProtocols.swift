//
//  PostDetailProtocol.swift
//  viper-example
//
//  Created by Priyam Dutta on 26/04/20.
//  Copyright © 2020 Priyam Dutta. All rights reserved.
//

import UIKit

protocol PostDetailViewToPresenterProtocol: class {
    var view: PostDetailViewProtocol? { get set }
    var wireFrame: PostDetailWireFrameProtocol? { get set }
    var post: PostModel? { get set }
    // View to Presenter
    func viewDidLoad()
    func onSetPostSelected(forPost post: PostModel)
    func dismissController(completion: @escaping () -> Void)
}

protocol PostDetailViewProtocol: class {
    var presenter: PostDetailViewToPresenterProtocol? { get set }
    // Presenter to View
    func showPostDetail(forPost post: PostModel)
}

protocol PostDetailPresenterToInteractorProtocol {
    
}

protocol PostDetailInteractorToPresenterProtocol {
    
}

protocol PostDetailWireFrameProtocol: class {
    var moduleDelegate: PostListDetailModeuleDelegate? { get set }
    static func createPostDetailModule(withPost post: PostModel, delegate: PostListDetailModeuleDelegate?) -> UIViewController
    func dismissController(view: PostDetailViewProtocol, completion: @escaping () -> Void?)
}

protocol PostListDetailModeuleDelegate: class {
    func onSetPostSelected(forPost post: PostModel)
}

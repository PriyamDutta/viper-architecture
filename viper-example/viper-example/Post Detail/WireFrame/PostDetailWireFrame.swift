//
//  PostDetailWireFrame.swift
//  viper-example
//
//  Created by Priyam Dutta on 26/04/20.
//  Copyright © 2020 Priyam Dutta. All rights reserved.
//

import Foundation
import UIKit

final class PostDetailWireFrame: PostDetailWireFrameProtocol {
    
    weak var moduleDelegate: PostListDetailModeuleDelegate?
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createPostDetailModule(withPost post: PostModel, delegate: PostListDetailModeuleDelegate?) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "PostDetailView")
        guard let view = viewController as? PostDetailView else { return UIViewController() }
        let presenter: PostDetailViewToPresenterProtocol = PostDetailPresenter()
        let wireFrame: PostDetailWireFrameProtocol = PostDetailWireFrame()
        wireFrame.moduleDelegate = delegate
        view.presenter = presenter
        presenter.view = view
        presenter.post = post
        presenter.wireFrame = wireFrame
        return viewController
    }
    
    func dismissController(view: PostDetailViewProtocol, completion: @escaping () -> Void?) {
        if let view = view as? UIViewController {
            view.navigationController?.popViewController(animated: true)
            completion()
        }
    }
}

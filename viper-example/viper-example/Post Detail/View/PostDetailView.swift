//
//  PostDetailView.swift
//  viper-example
//
//  Created by Priyam Dutta on 26/04/20.
//  Copyright © 2020 Priyam Dutta. All rights reserved.
//

import UIKit

final class PostDetailView: UIViewController, PostDetailViewProtocol {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDetail: UILabel!
    
    var presenter: PostDetailViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    func showPostDetail(forPost post: PostModel) {
        labelTitle.text = post.title
        labelDetail.text = post.body
    }
    
    @IBAction func actionSelected(sender: UIButton) {
        if let post = presenter?.post {
            presenter?.dismissController(completion: { [weak self] in
                if let weakSelf = self {
                    weakSelf.presenter?.onSetPostSelected(forPost: post)
                }
            })
        }
    }
    
    deinit {
        print("PostDetailView Deinit")
    }
}

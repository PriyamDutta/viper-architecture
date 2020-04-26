//
//  PostListCell.swift
//  viper-example
//
//  Created by Priyam Dutta on 26/04/20.
//  Copyright © 2020 Priyam Dutta. All rights reserved.
//

import UIKit

final class PostListCell: UITableViewCell, ReusableViewProtocol {    

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(_ post: PostListItemViewModel) {
        labelTitle.text = post.postModel.title
        labelDetail.text = post.postModel.body
        contentView.backgroundColor = post.isSelected ? .systemIndigo : .white
        labelTitle.textColor = post.isSelected ? .white : .black
        labelDetail.textColor = post.isSelected ? .white : .black
    }
}

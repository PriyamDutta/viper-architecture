//
//  PostDataModel.swift
//  viper-example
//
//  Created by Priyam Dutta on 26/04/20.
//  Copyright © 2020 Priyam Dutta. All rights reserved.
//

import Foundation

struct PostModel: Codable {
    var id: Int = 0
    var userId: Int = 0
    var title: String = ""
    var body: String = ""
}

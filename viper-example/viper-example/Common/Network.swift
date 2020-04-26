//
//  Network.swift
//  viper-example
//
//  Created by Priyam Dutta on 26/04/20.
//  Copyright © 2020 Priyam Dutta. All rights reserved.
//

import Foundation

struct BaseUrl {
    static let api = "https://jsonplaceholder.typicode.com"
}

enum EndPoints {
    case posts
    
    var path: String {
        let url = BaseUrl.api
        switch self {
        case .posts:
            return "\(url)/users/1/posts"
        }
    }
}

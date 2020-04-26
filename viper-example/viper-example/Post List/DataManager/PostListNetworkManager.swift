//
//  PostListNetworkManager.swift
//  viper-example
//
//  Created by Priyam Dutta on 26/04/20.
//  Copyright © 2020 Priyam Dutta. All rights reserved.
//

import Foundation

final class PostListNetworkManager: PostListNetworkInputProtocol {
    weak var outputRequestManager: PostListNetworkOutputProtocol?
    
    func retrivePosts() {
        guard let url = URL(string: EndPoints.posts.path) else {
            assert(false, "Url not formed")
        }
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            DispatchQueue.main.async { [weak self] in
                guard let data = data, let _ = response else {
                    return
                }
                do {
                    let data = try JSONDecoder().decode([PostModel].self, from: data)
                    self?.outputRequestManager?.onReceivedResponse(.success(data))
                } catch let error {
                    self?.outputRequestManager?.onReceivedResponse(.failure(error))
                    print(error.localizedDescription)
                }
            }
        }).resume()
    }
}

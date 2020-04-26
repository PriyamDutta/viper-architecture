//
//  PostListView.swift
//  viper-example
//
//  Created by Priyam Dutta on 25/04/20.
//  Copyright © 2020 Priyam Dutta. All rights reserved.
//

import UIKit

final class PostListView: UITableViewController, PostListViewProtocol {
    private var postList: [PostListItemViewModel] = []
    var presenter: PostListToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postList.reserveCapacity(20)
        presenter?.viewDidLoad()
    }
}

extension PostListView {
    
    func showPosts(_ posts: [PostModel]) {
        let numberOfPosts = posts.count
        if postList.capacity < numberOfPosts {
            postList.reserveCapacity(numberOfPosts)
        }
        postList = posts.map({ PostListItemViewModel(postModel: $0) })
        tableView.reloadData()
    }
    
    func showLoading() {
        print("Show loader")
    }
    
    func hideLoading() {
        print("Hide loader")
    }
    
    func showError() {
        print("Show error")
    }
    
    func setPostSelected(_ post: PostModel) {
        if let index = postList.firstIndex(where: {$0.postModel.id == post.id}) {
            let viewModel = PostListItemViewModel(postModel: post, isSelected: true)
            postList.remove(at: index)
            postList.insert(viewModel, at: index)
            tableView.performBatchUpdates({
                tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .fade)
            }, completion: nil)
        }
    }
}

extension PostListView {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let postCell = tableView.dequeueReusableCell(withIdentifier: PostListCell.reuseableIdentifier) as? PostListCell else {
            assert(false, "Cell not instantiated")
        }
        let post = postList[indexPath.row]
        postCell.setData(post)
        return postCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = postList[indexPath.row]
        presenter?.showPostDetail(post.postModel)
    }
}

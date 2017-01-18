//
//  PostsVC.swift
//  Sample
//
//  Created by Mateus Pinheiro on 04/01/17.
//  Copyright © 2017 MAT. All rights reserved.
//

import UIKit

class PostsVC: UITableViewController {
    let vm = PostsVM()
    let notificationCenter = NotificationCenter.default
    
    
    override func viewDidLoad() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 64
        
        self.refreshControl?.addTarget(self, action: #selector(self.handlePullToRefresh), for: UIControlEvents.valueChanged)
        
        notificationCenter.addObserver(forName: Notifications.PostsStartLoading, object: nil, queue: nil, using: self.postsStartLoading)
        notificationCenter.addObserver(forName: Notifications.PostsDidLoad, object: nil, queue: nil, using: self.postsDidUpdate)
    }
    
    deinit {
        notificationCenter.removeObserver(self)
    }
    
    
    // MARK: UITableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        let post = vm.posts[indexPath.row]
        
        cell.title.text = post.title
        cell.desc.text = post.body
        
        return cell
    }
    
    
    // MARK: Pull to refresh
    
    func handlePullToRefresh() {
        vm.getAllPosts(completion: nil)
    }
    
    
    // MARK: Handle notifications
    
    func postsStartLoading(_ notification: Notification) {
        DispatchQueue.main.async { self.refreshControl?.beginRefreshing() }
    }
    
    func postsDidUpdate(_ notification: Notification) {
        self.tableView.reloadData()
        DispatchQueue.main.async { self.refreshControl?.endRefreshing() }
    }
}

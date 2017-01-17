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
    
    override func viewDidLoad() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 64
        vm.getAllPosts(completion: nil)
    }
    
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
}

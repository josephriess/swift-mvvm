//
//  PostsVM.swift
//  Sample
//
//  Created by Mateus Pinheiro on 09/01/17.
//  Copyright © 2017 MAT. All rights reserved.
//

import Foundation

class PostsVM {
    let postsOP = PostsOP()
    
    var state: States = .done
    var posts: [Post] = []
    
    func getAllPosts(completion: @escaping VoidCompletion) {
        postsOP.getAll { results in
            print("completou callback do vm")
            completion()
        }
        
    }
}

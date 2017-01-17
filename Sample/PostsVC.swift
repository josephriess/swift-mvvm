//
//  PostsVC.swift
//  Sample
//
//  Created by Mateus Pinheiro on 04/01/17.
//  Copyright © 2017 MAT. All rights reserved.
//

import UIKit

class PostsVC: UIViewController {
    let vm = PostsVM()
    
    override func viewDidLoad() {
        vm.getAllPosts {
            print("completou do vc")
        }
    }
}

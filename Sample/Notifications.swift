//
//  Notifications.swift
//  Sample
//
//  Created by Mateus Pinheiro on 17/01/17.
//  Copyright © 2017 MAT. All rights reserved.
//

import Foundation

struct Notifications {
    // GENERIC
    static let GenericError = NSNotification.Name("GenericError")
    
    // POSTS
    static let PostsDidLoad = NSNotification.Name("PostsDidLoad")
    static let PostsDidError = NSNotification.Name("PostsDidError")
}

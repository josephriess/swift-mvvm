//
//  Post.swift
//  Sample
//
//  Created by Mateus Pinheiro on 04/01/17.
//  Copyright © 2017 MAT. All rights reserved.
//

import Argo
import Curry
import Runes

struct Post {
    let title: String
    let body: String
}

extension Post: Decodable {
    
    static func decode(_ json: JSON) -> Decoded<Post> {
        return curry(Post.init)
            <^> json <| "title"
            <*> json <| "body"
    }
}

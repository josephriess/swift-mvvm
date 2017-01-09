//
//  Post.swift
//  Sample
//
//  Created by Mateus Pinheiro on 04/01/17.
//  Copyright © 2017 MAT. All rights reserved.
//

import Gloss
import RealmSwift

class Post: Object, Decodable {
    var userUid: Int = 0
    var id: Int = 0
    var title: String = ""
    var body: String = ""
    
    required convenience init?(json: JSON) {
        self.init()
        
        guard
            let userUid: Int = "userUid" <~~ json,
            let id: Int = "id" <~~ json,
            let title: String = "title" <~~ json,
            let body: String = "body" <~~ json
            else { return nil }
        
        self.userUid = userUid
        self.id = id
        self.title = title
        self.body = body
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

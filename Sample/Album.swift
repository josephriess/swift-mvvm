//
//  Album.swift
//  Sample
//
//  Created by Mateus Pinheiro on 05/01/17.
//  Copyright © 2017 MAT. All rights reserved.
//

import Gloss
import RealmSwift

class Album: Object, Decodable {
    var id: Int = 0
    var userUid: Int = 0
    var title: String = ""
    
    required convenience init?(json: JSON) {
        self.init()
        
        guard
            let userUid: Int = "userUid" <~~ json,
            let id: Int = "id" <~~ json,
            let title: String = "title" <~~ json
            else { return nil }
    
        self.userUid = userUid
        self.id = id
        self.title = title
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

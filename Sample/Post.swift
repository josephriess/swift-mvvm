//
//  Post.swift
//  Sample
//
//  Created by Mateus Pinheiro on 04/01/17.
//  Copyright © 2017 MAT. All rights reserved.
//

import RealmSwift
import ObjectMapper

class Post: Object, Mappable {
    dynamic var userId: Int = 0
    dynamic var id: Int = 0
    dynamic var title: String = ""
    dynamic var body: String = ""
    
    required convenience init?(map: Map) { self.init() }
    
    override static func primaryKey() -> String? { return "id" }
    
    func mapping(map: Map) {
        id     <- map["id"]
        userId <- map["userId"]
        title  <- map["title"]
        body   <- map["body"]
    }
}

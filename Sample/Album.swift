//
//  Album.swift
//  Sample
//
//  Created by Mateus Pinheiro on 05/01/17.
//  Copyright © 2017 MAT. All rights reserved.
//

import RealmSwift
import ObjectMapper

class Album: Object, Mappable {
    dynamic var id: Int = 0
    dynamic var userId: Int = 0
    dynamic var title: String = ""
    dynamic var cover: String = ""
    
    override static func primaryKey() -> String? { return "id" }
    
    required convenience init?(map: Map) { self.init() }
    
    func mapping(map: Map) {
        id     <- map["id"]
        userId <- map["userId"]
        title  <- map["title"]
    }
}

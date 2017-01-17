//
//  System.swift
//  Sample
//
//  Created by Mateus Pinheiro on 17/01/17.
//  Copyright © 2017 MAT. All rights reserved.
//

import RealmSwift

class System: Object {
    dynamic var id: Int = 0
    
    dynamic var lastPostUpdate: Date?
    dynamic var lastAlbumUpdate: Date?
    dynamic var lastTaskUpdate: Date?
    
    override static func primaryKey() -> String? { return "id" }
}

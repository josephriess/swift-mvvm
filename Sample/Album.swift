//
//  Album.swift
//  Sample
//
//  Created by Mateus Pinheiro on 05/01/17.
//  Copyright © 2017 MAT. All rights reserved.
//

import Argo
import Runes
import Curry

struct Album {
    let title: String
}

extension Album: Decodable {

    static func decode(_ json: JSON) -> Decoded<Album> {
        return curry(Album.init)
            <^> json <| "title"
    }
}

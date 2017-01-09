//
//  TypesAndStates.swift
//  Sample
//
//  Created by Mateus Pinheiro on 09/01/17.
//  Copyright © 2017 MAT. All rights reserved.
//

enum States {
    case loading
    case done
    case error
}

enum Errors: Error {
    case Invalid
    case AlreadyExists
}

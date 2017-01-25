//
//  UIViewControllerExtension.swift
//  Sample
//
//  Created by Joe Riess on 1/24/17.
//  Copyright © 2017 MAT. All rights reserved.
//

import UIKit

extension UIViewController {
    
    static var storyboardIdentifier: String {
        return self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
    }
}

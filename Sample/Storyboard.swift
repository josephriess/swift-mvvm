//
//  Storyboard.swift
//  Sample
//
//  Created by Joe Riess on 1/24/17.
//  Copyright © 2017 MAT. All rights reserved.
//

import UIKit

enum Storyboard: String {
    
    case posts = "Posts"
    case tasks = "Tasks"
    case tabBar = "Tab Bar"
    case albums = "Albums"
    
    public func instantiate<VC: UIViewController>(viewController: VC.Type, inBundle bundle: Bundle? = Bundle.main) -> VC {
        
        guard let vc = UIStoryboard(name: self.rawValue, bundle: bundle)
            .instantiateViewController(withIdentifier: VC.storyboardIdentifier) as? VC else {
                fatalError("Couldn't instantiate \(VC.storyboardIdentifier) from \(self.rawValue)") }
        
        return vc
    }

}

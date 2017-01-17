//
//  PostsOP.swift
//  Sample
//
//  Created by Mateus Pinheiro on 09/01/17.
//  Copyright © 2017 MAT. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import RealmSwift

class PostsOP {
    let notificationCenter = NotificationCenter.default
    let utilityQueue = DispatchQueue(label: "utility", qos: .utility, target: nil)
    
    func getAll(completion: @escaping VoidCompletion) {
        utilityQueue.async {
            let url = "\(Constants.apiUrl)/posts"
            let notificationCenter = NotificationCenter.default
            
            Alamofire.request(url).responseArray { (response: DataResponse<[Post]>) in
                guard let posts = response.result.value
                    else { self.handleError(); return }
                
                guard self.savePosts(posts: posts)
                    else { self.handleError(); return }
                
                completion()
                notificationCenter.post(name: Notifications.PostsDidLoad, object: nil)
            }
        }
    }
    
    func savePosts(posts: [Post]) -> Bool {
        do {
            let realm = try Realm()
            try realm.write {
                for post in posts { realm.add(post, update: true) }
            }
            return true
        }
        catch { return false }
    }
    
    func handleError() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.post(name: Notifications.PostsDidError, object: nil)
    }
    
}

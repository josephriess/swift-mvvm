//
//  PostsOP.swift
//  Sample
//
//  Created by Mateus Pinheiro on 09/01/17.
//  Copyright © 2017 MAT. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import RealmSwift

class PostsOP {
    let url = "\(Constants.apiUrl)/posts"
    let notificationCenter = NotificationCenter.default
    let utilityQueue = DispatchQueue(label: "utility", qos: .utility, target: nil)
    
    func getAll(completion: @escaping VoidCompletion) {
        utilityQueue.async {
            self.notificationCenter.post(name: Notifications.PostsStartLoading, object: nil)
            
            Alamofire.request(self.url).responseArray { (response: DataResponse<[Post]>) in
                guard let posts = response.result.value
                    else { self.handleError(); return }
                
                guard self.savePosts(posts)
                    else { self.handleError(); return }
                
                completion()
                self.notificationCenter.post(name: Notifications.PostsDidLoad, object: nil)
            }
        }
    }
    
    func savePosts(_ posts: [Post]) -> Bool {
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
        notificationCenter.post(name: Notifications.PostsDidError, object: nil)
    }
}

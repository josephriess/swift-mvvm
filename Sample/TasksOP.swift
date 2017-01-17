//
//  TasksOP.swift
//  Sample
//
//  Created by Mateus Pinheiro on 17/01/17.
//  Copyright © 2017 MAT. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import RealmSwift

class TasksOP {
    let url = "\(Constants.apiUrl)/todos"
    let notificationCenter = NotificationCenter.default
    let utilityQueue = DispatchQueue(label: "utility", qos: .utility, target: nil)
    
    func getAll(completion: @escaping VoidCompletion) {
        utilityQueue.async {
            Alamofire.request(self.url).responseArray { (response: DataResponse<[Task]>) in
                guard let tasks = response.result.value
                    else { self.handleError(); return }
                
                guard self.saveAlbums(tasks)
                    else { self.handleError(); return }
                
                completion()
                self.notificationCenter.post(name: Notifications.TasksDidLoad, object: nil)
            }
        }
    }
    
    func saveAlbums(_ tasks: [Task]) -> Bool {
        do {
            let realm = try Realm()
            try realm.write {
                for task in tasks { realm.add(task, update: true) }
            }
            return true
        }
        catch { return false }
    }
    
    func handleError() {
        notificationCenter.post(name: Notifications.TasksDidError, object: nil)
    }
}


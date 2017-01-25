//
//  AlbumsOP.swift
//  Sample
//
//  Created by Mateus Pinheiro on 17/01/17.
//  Copyright © 2017 MAT. All rights reserved.
//

// import Alamofire
// import AlamofireObjectMapper
// import RealmSwift

// class AlbumsOP {
//     let url = "\(Constants.apiUrl)/albums"
//     let notificationCenter = NotificationCenter.default
//     let utilityQueue = DispatchQueue(label: "utility", qos: .utility, target: nil)

//     func getAll(completion: @escaping VoidCompletion) {
//         utilityQueue.async {
//             Alamofire.request(self.url).responseArray { (response: DataResponse<[Album]>) in
//                 guard
//                     let albums = response.result.value,
//                     self.saveAlbums(albums)
//                     else { self.handleError(); return }

//                 completion()
//                 self.notificationCenter.post(name: Notifications.AlbumsDidLoad, object: nil)
//             }
//         }
//     }

//     func saveAlbums(_ albums: [Album]) -> Bool {
//         do {
//             let realm = try Realm()
//             try realm.write {
//                 for album in albums { realm.add(album, update: true) }
//             }
//             return true
//         }
//         catch { return false }
//     }

//     func handleError() {
//         notificationCenter.post(name: Notifications.AlbumsDidError, object: nil)
//     }
// }


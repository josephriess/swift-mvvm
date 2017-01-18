//
//  AlbumsVC.swift
//  Sample
//
//  Created by Mateus Pinheiro on 04/01/17.
//  Copyright © 2017 MAT. All rights reserved.
//

import UIKit

class AlbumsVC: UITableViewController {
    
    
    override func viewDidLoad() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80
    }
    
    
    // MARK: UITableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as! AlbumCell
        
        return cell
    }
}

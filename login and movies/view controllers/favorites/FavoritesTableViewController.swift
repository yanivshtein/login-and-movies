//
//  FavoritesTableViewController.swift
//  login and movies
//
//  Created by yaniv shtein on 13/06/2022.
//

import UIKit

class FavoritesTableViewController: UITableViewController {

    var favorites:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        favorites = DefaultsManager.shared.readFavorites()
        tableView.reloadData()
    }

    

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return favorites.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        if let cell = cell as? FavoritesTableViewCell{
            cell.title.text = favorites[row]
        }

        return cell
    }
    

}

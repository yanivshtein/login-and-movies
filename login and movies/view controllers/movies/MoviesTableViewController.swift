//
//  MoviesTableViewController.swift
//  login and movies
//
//  Created by yaniv shtein on 10/06/2022.
//

import UIKit
import Combine
import SwiftUI

class MoviesTableViewController: UITableViewController {

    var movies:[Movie] = []
    var subscriptions: Set<AnyCancellable> = []
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let publisher = requestMoviesCombine()
        
        publisher
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print("finished")
            } receiveValue: {[weak self] result in
        
                guard let strongSelf = self else {return}
                
                    
                strongSelf.movies = result.results
                    
                
                    
                    strongSelf.tableView.reloadData()
                }.store(in: &subscriptions)
        view.backgroundColor = .systemGreen
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        if let cell = cell as? MovieTableViewCell{
            cell.movieTitle.text = movies[row].title
            print(movies[row].title)
        }
        

        return cell
    }
    
}

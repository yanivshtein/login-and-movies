//
//  MovieTableViewCell.swift
//  login and movies
//
//  Created by yaniv shtein on 10/06/2022.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBAction func addToFavorites(_ sender: UIButton) {
        if let title = movieTitle.text{
        DefaultsManager.shared.saveFavorites(movie: title)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}

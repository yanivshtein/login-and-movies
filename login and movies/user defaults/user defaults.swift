//
//  user defaults.swift
//  login and movies
//
//  Created by yaniv shtein on 13/06/2022.
//

import Foundation

public class DefaultsManager{
    
    static let shared = DefaultsManager()
    
    private init(){}
    
    func readFavorites()->[String]{
        guard let favorites = UserDefaults.standard.object(forKey: "favorites") as? [String] else {return []}

        return favorites
    }
    
    func saveFavorites(movie: String){
        var favorites = readFavorites()
        favorites.append(movie)
        
        UserDefaults.standard.set(favorites, forKey: "favorites")
    }
}

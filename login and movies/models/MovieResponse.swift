//
//  MovieResponse.swift
//  login and movies
//
//  Created by yaniv shtein on 10/06/2022.
//

import Foundation

struct MovieResponse :Decodable{
    let page: Int
    let results: [Movie]
}

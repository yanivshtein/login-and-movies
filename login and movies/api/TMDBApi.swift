//
//  TMDBApi.swift
//  login and movies
//
//  Created by yaniv shtein on 11/06/2022.
//

import Foundation
import Combine



func requestMoviesCombine()-> AnyPublisher<MovieResponse, Error>{
    
    let address = "https://api.themoviedb.org/3/movie/popular?api_key=cdc7b42882062211b0b50506be925109"
    
    let url = URL(string: address)!
    
    let urlSession = URLSession.shared
    
    
    return urlSession.dataTaskPublisher(for: url)
        .tryMap{ data,res in
        return try JSONDecoder().decode(MovieResponse.self, from: data)
    }.eraseToAnyPublisher()
    
}

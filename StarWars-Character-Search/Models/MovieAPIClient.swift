//
//  MovieAPIClient.swift
//  StarWars-Character-Search
//
//  Created by C4Q on 12/2/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
class MovieAPIClient {
    private init() {}
    static let manager = MovieAPIClient()
    func getMovie(from urlStr: String, completionHandler: @escaping (Movie) -> Void, errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else {return}
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let onlineMovie = try JSONDecoder().decode(Movie.self, from: data)
                completionHandler(onlineMovie)
            } catch let error {
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: completion, errorHandler: errorHandler)
    }
}

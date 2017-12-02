//
//  StartWarAPIClient.swift
//  StarWars-Character-Search
//
//  Created by C4Q on 12/1/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
class StarWarsAPIClient {
    private init() {}
    static let manager = StarWarsAPIClient()
    func getStarWars(from urlStr: String, completionHandler: @escaping (StarWars) -> Void, errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else {return}
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let onlineStarWars = try JSONDecoder().decode(StarWars.self, from: data)
                completionHandler(onlineStarWars)
            } catch let error {
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: completion, errorHandler: errorHandler)
    }
}

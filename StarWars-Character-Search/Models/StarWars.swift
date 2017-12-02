//
//  Person.swift
//  StarWars-Character-Search
//
//  Created by C4Q on 12/1/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

struct StarWars: Codable {
    let results: [Person]
}

struct Person: Codable {
    let name: String
    let height: String
    let hair_color: String
    let skin_color: String
    let eye_color: String
    let birth_year: String
    let gender: String
    let homeworld: String
    let films: [String]
    let species: [String]
}


struct Movie: Codable {
    let title: String
    let episode_id: Int
    let opening_crawl: String
    let director: String
    let producer: String
    let release_date: String
    
}


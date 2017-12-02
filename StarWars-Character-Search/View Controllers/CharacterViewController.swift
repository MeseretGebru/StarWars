//
//  CharacterViewController.swift
//  StarWars-Character-Search
//
//  Created by C4Q on 12/2/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {
    
    var person: Person? {
        didSet {
            loadMovies()
        }
    }
    var movies = [Movie]() {
        didSet {
            movieTableView.reloadData()
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    @IBOutlet weak var skinColorLabel: UILabel!
    @IBOutlet weak var eyesColorLabel: UILabel!
    @IBOutlet weak var movieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.movieTableView.delegate = self
        self.movieTableView.dataSource = self
        loadLabels()
    }
    
    func loadLabels() {
        if let person = person {
            nameLabel.text = person.name
            genderLabel.text = "Gender: \(person.gender)"
            heightLabel.text = "Height: \(person.height)"
            birthYearLabel.text = "Birth year: \(person.birth_year)"
            hairColorLabel.text = "Hair color: \(person.hair_color)"
            skinColorLabel.text = "Skin color: \(person.skin_color)"
            eyesColorLabel.text = "Eyes color: \(person.eye_color)"
        } else {
            nameLabel.text = "Name: Not found"
        }
    }
    
    func loadMovies() {
        if let person = person {
            person.films.forEach{ (movieStr: String) in
                let str = movieStr
                let completion: (Movie) -> Void = {(onlineMovie: Movie) in
                    self.movies.append(onlineMovie)
                }
                let errorHandler: (Error) -> Void = {(error: Error) in
                    let alert = UIAlertController(title: "Error", message: "\(error)", preferredStyle: UIAlertControllerStyle.alert)
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                }
                MovieAPIClient.manager.getMovie(from: str, completionHandler: completion, errorHandler: errorHandler)
            }
        }
        
    }
}


//
//  ViewController.swift
//  StarWars-Character-Search
//
//  Created by C4Q on 12/1/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class StarWarsViewController: UIViewController {

    @IBOutlet weak var starWarsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var people = [Person]() {
        didSet {
            self.peopleFilterd = people
            starWarsTableView.reloadData()
        }
    }
    var peopleFilterd = [Person]()
    
    var searchTerm = "" {
        didSet {
            if searchTerm.count > 0 {
                self.peopleFilterd = self.people.filter{$0.name.contains(searchTerm)}
            } else {
                self.peopleFilterd = self.people
            }
            starWarsTableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.starWarsTableView.delegate = self
        self.starWarsTableView.dataSource = self
        self.searchBar.delegate = self
        loadPeople()
    }
    
    func loadPeople() {
        let str = "https://swapi.co/api/people/"
        let completion: (StarWars) -> Void = {(onlineStarWars: StarWars) in
            self.people = onlineStarWars.results
        }
        let errorHandler: (Error) -> Void = {(error: Error) in
            let alert = UIAlertController(title: "Error", message: "\(error)", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        StarWarsAPIClient.manager.getStarWars(from: str, completionHandler: completion, errorHandler: errorHandler)
    }
}


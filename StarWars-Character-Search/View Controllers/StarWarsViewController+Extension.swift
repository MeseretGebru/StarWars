//
//  StarWarsViewController+Extension.swift
//  StarWars-Character-Search
//
//  Created by C4Q on 12/1/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
import UIKit
extension StarWarsViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleFilterd.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = peopleFilterd[indexPath.row]
        if let cell = starWarsTableView.dequeueReusableCell(withIdentifier: "StarWars Cell", for: indexPath) as? StarWarsTableViewCell {
            cell.personNameLabel.text = person.name
            cell.genderLabel.text = "Gender: \n \(person.gender)"
            cell.birthYearLabel.text = "Year of birth: \n \(person.birth_year)"
            cell.heightLabel.text = "Height: \n \(person.height)"
            if indexPath.row % 2 == 0 {
                cell.backgroundColor = .gray
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchTerm = searchText
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let person = peopleFilterd[starWarsTableView.indexPathForSelectedRow!.row]
        if let personDVC = segue.destination as? CharacterViewController {
            personDVC.person = person
        }
        
    }
}

//
//  CharacterViewController+Extension.swift
//  StarWars-Character-Search
//
//  Created by C4Q on 12/2/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
import UIKit

extension CharacterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movies[indexPath.row]
        let cell = movieTableView.dequeueReusableCell(withIdentifier: "Movie Cell", for: indexPath)
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .gray
            cell.textLabel?.textColor = .white
            cell.detailTextLabel?.textColor = .white
        }
        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text = movie.director
        return cell
    }
    
}

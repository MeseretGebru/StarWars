//
//  StarWarsTableViewCell.swift
//  StarWars-Character-Search
//
//  Created by C4Q on 12/1/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class StarWarsTableViewCell: UITableViewCell {

    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }


}

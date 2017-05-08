//
//  AnimalTableViewCell.swift
//  YourFirstTableView
//
//  Created by Ignacio Nieto Carvajal on 8/5/17.
//  Copyright © 2017 Digital Leaves. All rights reserved.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {
    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var animalLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWith(animalName: String) {
        self.animalImageView.image = UIImage(named: animalName)
        self.animalLabel.text = animalName
    }
    
}

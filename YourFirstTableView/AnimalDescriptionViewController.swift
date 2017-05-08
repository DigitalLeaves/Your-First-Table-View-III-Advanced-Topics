//
//  AnimalDescriptionViewController.swift
//  YourFirstTableView
//
//  Created by Ignacio Nieto Carvajal on 7/5/17.
//  Copyright © 2017 Digital Leaves. All rights reserved.
//

import UIKit

class AnimalDescriptionViewController: UIViewController {
    // outlets
    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var animalDescriptionLabel: UILabel!
    
    // data
    var animalName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animalImageView.image = UIImage(named: animalName)
        animalNameLabel.text = animalName
        animalDescriptionLabel.text = animalDescriptions[animalName]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

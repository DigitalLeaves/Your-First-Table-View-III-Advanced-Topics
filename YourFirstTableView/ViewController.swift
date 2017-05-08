//
//  ViewController.swift
//  YourFirstTableView
//
//  Created by Ignacio Nieto Carvajal on 5/5/17.
//  Copyright © 2017 Digital Leaves. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // outlets
    @IBOutlet weak var tableView: UITableView!
    
    // data
    let animals = ["dog", "cat", "tiger", "lion", "giraffe", "cow", "horse", "fox", "panda", "bear", "mouse", "pig", "rhinoceros", "hippopotamus", "rabbit", "elephant", "crocodile", "bird", "sheep", "gorilla"]
    var selectedAnimal = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "AnimalTableViewCell", bundle: nil), forCellReuseIdentifier: "AnimalTableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dvc = segue.destination as? AnimalDescriptionViewController {
            dvc.animalName = self.selectedAnimal
        }
    }
    
    // MARK: - UITableViewDelegate/DataSource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalTableViewCell", for: indexPath) as! AnimalTableViewCell
        let animalName = animals[indexPath.row]
        cell.configureWith(animalName: animalName)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedAnimal = animals[indexPath.row]
        self.performSegue(withIdentifier: "showAnimalDetails", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56.0
    }
}


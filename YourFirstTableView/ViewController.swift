//
//  ViewController.swift
//  YourFirstTableView
//
//  Created by Ignacio Nieto Carvajal on 5/5/17.
//  Copyright © 2017 Digital Leaves. All rights reserved.
//

import UIKit

private let allAnimals = ["dog", "cat", "tiger", "lion", "giraffe", "cow", "horse", "fox", "panda", "bear", "mouse", "pig", "rhinoceros", "hippopotamus", "rabbit", "elephant", "crocodile", "bird", "sheep", "gorilla"]

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // outlets
    @IBOutlet weak var tableView: UITableView!
    
    // data
    var animals = allAnimals
    var selectedAnimal = ""
    let pullToRefresh = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // register cell nib
        tableView.register(UINib(nibName: "AnimalTableViewCell", bundle: nil), forCellReuseIdentifier: "AnimalTableViewCell")
        
        // add pull to refresh
        pullToRefresh.attributedTitle = NSAttributedString(string: "Pull to bring all animals back!")
        pullToRefresh.addTarget(self, action: #selector(ViewController.resetAnimals), for: .valueChanged)
        tableView.addSubview(pullToRefresh)
    }
    
    func resetAnimals() {
        self.animals = allAnimals
        self.tableView.reloadData()

        pullToRefresh.endRefreshing()
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
    
    func showAlertMessage(message: String, afterDismissal: ((Void) -> Void)? = nil) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            afterDismissal?()
        }))
        self.present(alert, animated: true, completion: nil)
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
    
    // MARK: - Editing actions
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Kill") { (action, indexPath) in
            self.removeAnimalAtIndex(index: indexPath.row)
            // "close" the swipe
            self.tableView.setEditing(false, animated: true)
        }
        
        let feedAction = UITableViewRowAction(style: .normal, title: "Feed") { (action, indexPath) in
            if self.animals.count < 2 {
                self.showAlertMessage(message: "Nobody else here to eat 😐")
            } else {
                // the predator is our selected cell, look for a prey
                let predator = self.animals[indexPath.row]
                let preyIndex = Int(arc4random_uniform(UInt32(self.animals.count)))
                let prey = self.animals[preyIndex]
                // remove the prey and show message
                self.showAlertMessage(message: "Yum! Yum! The \(predator) ate the \(prey)", afterDismissal: { _ in
                    self.removeAnimalAtIndex(index: preyIndex)
                })
            }
            // "close" the swipe
            self.tableView.setEditing(false, animated: true)
        }
        
        
        return [deleteAction, feedAction]
    }
    
    func removeAnimalAtIndex(index: Int) {
        // remove the animal in the model.
        animals.remove(at: index)
        // fancy animation to delete the row
        tableView.beginUpdates()
        tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        tableView.endUpdates()
    }

}


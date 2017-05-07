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
    let animals = ["dog", "cat", "tiger", "lion", "giraffe", "cattle", "horse", "fox", "panda", "bear", "rat", "pig", "rhinoceros", "hippopotamus", "rabbit", "elephant", "crocodile", "bird", "sheep", "gorilla"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - UITableViewDelegate/DataSource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTableViewCell", for: indexPath) 
        cell.textLabel?.text = animals[indexPath.row]
        return cell
    }

}


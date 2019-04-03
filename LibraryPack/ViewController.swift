//
//  ViewController.swift
//  LibraryPack
//
//  Created by Anish Kumar on 8/29/18.
//  Copyright © 2018 Akamai. All rights reserved.
//

import UIKit
//import "DetailVC.h"

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    let frameworkArray: [String] = ["PINRemoteImage", "SDWebImage", "Kingfisher", "Alamofire", "AlamofireImage", "AFNetworking"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MainCell")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.frameworkArray.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as UITableViewCell
        
        // set the text from the data model
        cell.textLabel?.text = self.frameworkArray[indexPath.row]
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        
        // Safe Push VC
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailVCId") as? DetailVC
        {
            viewController.selectedType = indexPath.row
            
            if let navigator = navigationController
            {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
}


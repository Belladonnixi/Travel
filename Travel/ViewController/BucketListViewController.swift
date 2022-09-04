//
//  ViewController.swift
//  Travel
//
//  Created by Jessica Ernst on 02.09.22.
//

import UIKit

class BucketListViewController: UIViewController {

    var wannaGoToTargets = [String]()
    let sectionHeaderTitle = ["Want to go to travel destinations","Travelled destinations"]
    var wentToTargets = [String]()
   
    @IBOutlet weak var bucketListTV: UITableView!
    @IBOutlet weak var editBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        bucketListTV.dataSource = self
        bucketListTV.delegate = self
        
        let leftButton = UIBarButtonItem(title: "Edit", style: UIBarButtonItem.Style.plain, target: self, action: Selector(("showEditing:")))
            navigationItem.leftBarButtonItem = leftButton
    }
    
    @IBAction func addTargetBtn(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add Travel Destination", message: "To which Destinations would you like to travel?", preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Add", style: .default, handler: { [self] (_) in
            
            let textField = alert.textFields?.first
            let itemToAdd = textField?.text
            
            wannaGoToTargets.append(itemToAdd!)
            bucketListTV.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addTextField()
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    
    @IBAction func editingBtn(_ sender: UIBarButtonItem) {
        if bucketListTV.isEditing == true
            {
                bucketListTV.isEditing = false
                editBtn.title = "Edit"
            }
            else
            {
                bucketListTV.isEditing = true
                editBtn.title = "Done"
            }
    }
}


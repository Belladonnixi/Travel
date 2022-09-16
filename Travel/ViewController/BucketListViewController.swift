//
//  BucketListViewController.swift
//  Travel
//
//  Created by Jessica Ernst on 13.09.22.
//

import UIKit

class BucketListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureItems()
        
    }
    
    private func configureItems() {
        navigationItem.leftBarButtonItem =
            editButtonItem
            
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addTargetBtn))
    }

    @objc func addTargetBtn() {
        let childView = self.children.last as! BucketListTableViewController
        let alert = UIAlertController(title: "Add Travel Destination", message: "To which Destinations would you like to travel?", preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Add", style: .default, handler: { (_) in
            
            let textField = alert.textFields?.first
            let itemToAdd = textField?.text
            
            childView.wannaGoToTargets.append(itemToAdd!)
            childView.tableView.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addTextField()
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

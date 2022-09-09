//
//  BucketListTableViewController.swift
//  Travel
//
//  Created by Jessica Ernst on 06.09.22.
//

import UIKit

class BucketListTableViewController: UITableViewController {
    
    var wannaGoToTargets = [String]()
    let sectionHeaderTitle = ["Want to go to travel destinations","Travelled destinations"]
    var wentToTargets = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.navigationItem.title = "Travel Bucket List"
         configureItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Add a background view to the table view
        let backgroundImage = UIImage(named: "brett-zeck-eyfMgGvo9PA-unsplash")
        let imageView = UIImageView(image: backgroundImage)
        imageView.contentMode = .scaleAspectFill
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemUltraThinMaterial)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = imageView.bounds
        imageView.addSubview(blurView)
        self.tableView.backgroundView = imageView
    }
    
    private func configureItems() {
        navigationItem.leftBarButtonItem =
            editButtonItem
            
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addTargetBtn))
        
    }
    
    @objc func addTargetBtn() {
        let alert = UIAlertController(title: "Add Travel Destination", message: "To which Destinations would you like to travel?", preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Add", style: .default, handler: { [self] (_) in
            
            let textField = alert.textFields?.first
            let itemToAdd = textField?.text
            
            wannaGoToTargets.append(itemToAdd!)
            self.tableView.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addTextField()
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    // MARK: - Table view data source    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(sectionHeaderTitle[section])"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? wannaGoToTargets.count : wentToTargets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "travelTargetCell", for: indexPath)
        cell.backgroundColor = UIColor(white: 1, alpha: 0.2)
        
        var content = cell.defaultContentConfiguration()
        
        
        if indexPath.section == 0 {
            cell.accessoryType = .none
            content.text = wannaGoToTargets[indexPath.row]
            } else {
                cell.accessoryType = .checkmark
                content.text = wentToTargets[indexPath.row]
            }
        
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if indexPath.section == 0 {
                wannaGoToTargets.remove(at: indexPath.row)
            } else {
                wentToTargets.remove(at: indexPath.row)
            }
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        // reset Edit Button when all items are deleted
        if wentToTargets.count < 1 && wannaGoToTargets.count < 1 {
            isEditing = false
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == 0) {
            wentToTargets.append(wannaGoToTargets[indexPath.row])
            wannaGoToTargets.remove(at: indexPath.row)
        } else {
            wannaGoToTargets.append(wentToTargets[indexPath.row])
            wentToTargets.remove(at: indexPath.row)
        }
        self.tableView.reloadData()
    }
}

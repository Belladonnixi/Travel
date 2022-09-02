//
//  BucketListViewControllerExtensions.swift
//  Travel
//
//  Created by Jessica Ernst on 02.09.22.
//
import UIKit
import Foundation

extension BucketListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(sectionHeaderTitle[section])"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? wannaGoToTargets.count : wentToTargets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = bucketListTV.dequeueReusableCell(withIdentifier: "travelTargetCell", for: indexPath)
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if indexPath.section == 0 {
                wannaGoToTargets.remove(at: indexPath.row)
            } else {
                wentToTargets.remove(at: indexPath.row)
            }
            bucketListTV.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension BucketListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == 0) {
            wentToTargets.append(wannaGoToTargets[indexPath.row])
            wannaGoToTargets.remove(at: indexPath.row)
        } else {
            wannaGoToTargets.append(wentToTargets[indexPath.row])
            wentToTargets.remove(at: indexPath.row)
        }
        bucketListTV.reloadData()
    }
}

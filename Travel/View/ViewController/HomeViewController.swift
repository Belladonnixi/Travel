//
//  HomeViewController.swift
//  Travel
//
//  Created by Jessica Ernst on 08.09.22.
//

import UIKit

class HomeViewController: UIViewController {

    var userId: Int!
    var userName: String!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = userName
        userIdLabel.text = String(userId)
    }
}

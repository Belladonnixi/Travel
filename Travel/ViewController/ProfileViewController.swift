//
//  ProfileViewController.swift
//  Travel
//
//  Created by Jessica Ernst on 08.09.22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var userId: Int!
    var userName: String!
    var email: String!

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            userNameLabel.text = userName
            emailLabel.text = email
            passwordLabel.isHidden = false
       
        
    }

    @IBAction func loggout(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginNavController = storyboard.instantiateViewController(identifier: "LoginNavigationController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.setRootViewController(loginNavController)
    }
    
}

//
//  CustomTabBarController.swift
//  Travel
//
//  Created by Jessica Ernst on 08.09.22.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    var userId: Int!
    var userName: String!
    var email: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        // make sure vc not nil
        guard let viewControllers = viewControllers else {return}
        
        // passing userID, name and email to viewControllers
        for vc in viewControllers {
            if let homeVC = vc as? HomeNavigationController {
                if let main = homeVC.viewControllers.first as?
                    HomeViewController {
                    main.userId = userId
                    main.userName = userName
                }
            }
            if let profileVC = vc as? ProfileViewController {
                profileVC.userId = userId
                profileVC.userName = userName
                profileVC.email = email
                
            }
        }
    }
}

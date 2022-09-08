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
    var password: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        
        // make sure vc not nil
        guard let viewControllers = viewControllers else {return}
        
        // passing userID to viewControllers
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

            }
        }
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

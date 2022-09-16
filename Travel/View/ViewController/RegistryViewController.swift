//
//  RegistryViewController.swift
//  Travel
//
//  Created by Jessica Ernst on 07.09.22.
//

import UIKit

class RegistryViewController: UIViewController {
    
    var appUser : [String:String]? = [
        "name": "Jessi",
        "password": "abcd",
        "email": "something@something.com",
        "id": "1"
    ]

    @IBOutlet weak var blurView: UIVisualEffectView!
    
    @IBOutlet weak var userNameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var repeatPasswordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureBlurView()
    }
    
    @IBAction func registerUser(_ sender: UIButton) {
        
        if userNameLabel.hasText && emailLabel.hasText && passwordLabel.hasText && repeatPasswordLabel.hasText {
            if passwordLabel.text == repeatPasswordLabel.text {
                appUser = [
                    "name": userNameLabel.text!,
                    "password": passwordLabel.text!,
                    "email": emailLabel.text!,
                    "id": "2"
                ]
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController") as! MainTabBarController
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.setRootViewController(mainTabBarController, Int(appUser!["id"] ?? "0"), String(appUser?["name"] ?? "something"), String(appUser?["email"] ?? "something"))
            }
        }
        
    }
    
    private func configureBlurView() {
        blurView.layer.cornerRadius = 25
        blurView.clipsToBounds = true
        view.addSubview(blurView)
    }
}

//
//  LoginViewController.swift
//  Travel
//
//  Created by Jessica Ernst on 07.09.22.
//

import UIKit

class LoginViewController: UIViewController {
    
    var appUser : [String:String]? = [
        "name": "Jessi",
        "password": "abcd",
        "email": "something@something.com",
        "id": "1"
    ]
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var failureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureBlurView()
        
    }
    
    private func configureBlurView() {
        blurView.layer.cornerRadius = 25
        blurView.clipsToBounds = true
        blurView.center = self.view.center
        view.addSubview(blurView)
    }
    
    @IBAction func logIn(_ sender: UIButton) {
        
        if appUser!["name"] == userName.text && appUser!["password"] == password.text {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController") as! MainTabBarController
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.setRootViewController(mainTabBarController, Int(appUser!["id"] ?? "0"), String(appUser?["name"] ?? "something"))
        } else if appUser!["name"] != userName.text && appUser!["password"] != password.text{
            userName.text = ""
            password.text = ""
            failureLabel.text = "Wrong Username Or Password! \n Please try again"
            failureLabel.isHidden = false
        } else if appUser!["name"] != userName.text {
            userName.text = ""
            failureLabel.text = "Wrong Username! Please try again"
            failureLabel.isHidden = false
        } else if appUser!["password"] != password.text {
            password.text = ""
            failureLabel.text = "Wrong Password! Please try again"
            failureLabel.isHidden = false
        }
    }
    
}

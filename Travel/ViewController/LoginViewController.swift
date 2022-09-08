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
        "id": "1"
    ]

    @IBOutlet weak var blurView: UIVisualEffectView!
    
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
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController") as! MainTabBarController
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.setRootViewController(mainTabBarController, Int(appUser!["id"] ?? "0"))
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

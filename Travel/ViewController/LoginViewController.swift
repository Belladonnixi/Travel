//
//  LoginViewController.swift
//  Travel
//
//  Created by Jessica Ernst on 07.09.22.
//

import UIKit

class LoginViewController: UIViewController {
    
    var appUser : [String:String]? = [
        "name": "Jessica",
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

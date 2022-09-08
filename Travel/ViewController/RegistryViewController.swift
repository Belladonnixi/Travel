//
//  RegistryViewController.swift
//  Travel
//
//  Created by Jessica Ernst on 07.09.22.
//

import UIKit

class RegistryViewController: UIViewController {

    @IBOutlet weak var blurView: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureBlurView()
    }
    
    private func configureBlurView() {
        blurView.layer.cornerRadius = 25
        blurView.clipsToBounds = true
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

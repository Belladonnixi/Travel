//
//  PhotoDetailViewController.swift
//  Travel
//
//  Created by Jessica Ernst on 06.09.22.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var selectedPhoto: String?
    
    @IBOutlet weak var photoIV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoIV.image = UIImage(named: selectedPhoto!)
    }
}

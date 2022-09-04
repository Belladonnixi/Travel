//
//  PhotoAlbumCollectionViewCell.swift
//  Travel
//
//  Created by Jessica Ernst on 04.09.22.
//

import UIKit

class PhotoAlbumCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoIv: UIImageView!
    @IBOutlet weak var selectLabel: UILabel!
    
    var isEditing: Bool = false {
        didSet {
            selectLabel.isHidden = !isEditing
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if isEditing {
                selectLabel.text = isSelected ? "✓" : ""
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectLabel.layer.cornerRadius = 15
        self.selectLabel.layer.masksToBounds = true
        self.selectLabel.layer.borderColor = UIColor.systemTeal.cgColor
        self.selectLabel.layer.borderWidth = 1.0
        self.selectLabel.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
}

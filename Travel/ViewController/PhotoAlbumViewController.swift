//
//  PhotoAlbumViewController.swift
//  Travel
//
//  Created by Jessica Ernst on 02.09.22.
//

import UIKit

class PhotoAlbumViewController: UIViewController {

    @IBOutlet weak var photoAlbumCV: UICollectionView!
    
    let photos: [String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44"]
    
    var rndPhoto = [String]()
    
    let sectionInsets = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
    
    let itemsPerRow: CGFloat = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoAlbumCV.delegate = self
        photoAlbumCV.dataSource = self
        
        navigationItem.title = "Photo Album"
        configureItems()
        addLongPressFunctionality()
    }
    
    private func configureItems() {
        navigationItem.leftBarButtonItem =
            editButtonItem
            
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addRandomPhotoBtn))
        
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        photoAlbumCV.allowsMultipleSelection = editing
        photoAlbumCV.indexPathsForVisibleItems.forEach { (indexPath) in
            let cell = photoAlbumCV.cellForItem(at: indexPath) as!
                PhotoAlbumCollectionViewCell
            cell.isEditing = editing
            
            if editing {
                navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(self.deletingPhotosBtn))
            } else {
                navigationItem.rightBarButtonItem =
                    UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addRandomPhotoBtn))
            }
        }
    }
    
    @objc func addRandomPhotoBtn() {
        let rnd = photos.randomElement()
        if !rndPhoto.contains(rnd!) { rndPhoto.insert(rnd!, at: 0)
        } else if rndPhoto.count <= 43 {
            let alert = UIAlertController(title: "Oh nooo..", message: "The photo you've tried to add is existing in Album. \n Please try again!", preferredStyle: .alert)
            
            alert.addAction(
                UIAlertAction(
                    title: "Close", style: .cancel
                ))
            
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Sorry..", message: "No more photos to add", preferredStyle: .alert)
            
            alert.addAction(
                UIAlertAction(
                    title: "Close", style: .cancel
                ))
            
            self.present(alert, animated: true, completion: nil)
        }
        photoAlbumCV.reloadData()
    }
    
    @objc func deletingPhotosBtn() {
        if let selectedCells = photoAlbumCV.indexPathsForSelectedItems {
            let items = selectedCells.map { $0.item }.sorted().reversed()
            for item in items {
                rndPhoto.remove(at: item)
            }
            photoAlbumCV.deleteItems(at: selectedCells)
        }
        if rndPhoto.count < 1 {
            configureItems()
            isEditing = false
        }
    }
}

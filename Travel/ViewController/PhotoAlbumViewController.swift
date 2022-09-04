//
//  PhotoAlbumViewController.swift
//  Travel
//
//  Created by Jessica Ernst on 02.09.22.
//

import UIKit

class PhotoAlbumViewController: UIViewController {

    @IBOutlet weak var photoAlbumCV: UICollectionView!
    
    @IBOutlet weak var editBtn: UIBarButtonItem!
    
    @IBOutlet weak var addBtn: UIBarButtonItem!
    
    @IBOutlet weak var deleteBtn: UIBarButtonItem!
    
    let photos: [String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44"]
    
    var rndPhoto = [String]()
    
    let sectionInsets = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
    
    let itemsPerRow: CGFloat = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoAlbumCV.delegate = self
        photoAlbumCV.dataSource = self
        
        let leftButton = UIBarButtonItem(title: "Edit", style: UIBarButtonItem.Style.plain, target: self, action: Selector(("showEditing:")))
            navigationItem.leftBarButtonItem = leftButton
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        photoAlbumCV.allowsMultipleSelection = editing
        photoAlbumCV.indexPathsForVisibleItems.forEach { (indexPath) in
            let cell = photoAlbumCV.cellForItem(at: indexPath) as!
                PhotoAlbumCollectionViewCell
            cell.isEditing = editing
        }
    }
    
    @IBAction func addRandomPhotoBtn(_ sender: UIBarButtonItem) {
        let rnd = photos.randomElement()
        if !rndPhoto.contains(rnd!) { rndPhoto.append(rnd!)
        } else {
            let alert = UIAlertController(title: "Oh nooo..", message: "The photo you've tried to add is existing in Album. \n Please try again!", preferredStyle: .alert)
            
            alert.addAction(
                UIAlertAction(
                    title: "Close", style: .cancel
                ))
            
            self.present(alert, animated: true, completion: nil)
        }
        photoAlbumCV.reloadData()
    }
    
    @IBAction func editingBtn(_ sender: UIBarButtonItem) {
        if photoAlbumCV.isEditing == true
            {
                photoAlbumCV.isEditing = false
                editBtn.title = "Edit"
                setEditing(false, animated: false)
                addBtn.isEnabled = true
                deleteBtn.isEnabled = false
            }
            else
            {
                photoAlbumCV.isEditing = true
                editBtn.title = "Done"
                setEditing(true, animated: true)
                addBtn.isEnabled = false
                deleteBtn.isEnabled = true
            }
    }
    @IBAction func deletingPhotosBtn(_ sender: UIBarButtonItem) {
        if let selectedCells = photoAlbumCV.indexPathsForSelectedItems {
            let items = selectedCells.map { $0.item }.sorted().reversed()
            for item in items {
                rndPhoto.remove(at: item)
            }
            photoAlbumCV.deleteItems(at: selectedCells)
            deleteBtn.isEnabled = false
        }
    }
}

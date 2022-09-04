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
    
    let photos: [String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44"]
    
    var rndPhoto = [String]()
    
    private let sectionInsets = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
    
    private let itemsPerRow: CGFloat = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoAlbumCV.delegate = self
        photoAlbumCV.dataSource = self
        
        let leftButton = UIBarButtonItem(title: "Edit", style: UIBarButtonItem.Style.plain, target: self, action: Selector(("showEditing:")))
            navigationItem.leftBarButtonItem = leftButton
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
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
            }
            else
            {
                photoAlbumCV.isEditing = true
                editBtn.title = "Done"
            }
    }
}

extension PhotoAlbumViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedPhoto = rndPhoto[indexPath.row]
        print(selectedPhoto)
    }
    
}

extension PhotoAlbumViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rndPhoto.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoAlbumCollectionViewCell
        
        let photo = UIImage(named: rndPhoto[indexPath.row])
        
        cell.photoIv.image = photo
        cell.isEditing = isEditing
        
        return cell
    }
}

extension PhotoAlbumViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {

    let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
    let availableWidth = view.frame.width - paddingSpace
    let widthPerItem = availableWidth / itemsPerRow

    return CGSize(width: widthPerItem, height: widthPerItem)
  }

  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    insetForSectionAt section: Int
  ) -> UIEdgeInsets {
    return sectionInsets
  }

  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int
  ) -> CGFloat {
    return sectionInsets.left
  }
}



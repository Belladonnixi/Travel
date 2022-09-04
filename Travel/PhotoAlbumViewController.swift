//
//  PhotoAlbumViewController.swift
//  Travel
//
//  Created by Jessica Ernst on 02.09.22.
//

import UIKit

class PhotoAlbumViewController: UIViewController {

    @IBOutlet weak var photoAlbumTV: UICollectionView!
    
    @IBOutlet weak var editBtn: UIBarButtonItem!
    
    let photos: [String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44"]
    
    private let sectionInsets = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
    
    private let itemsPerRow: CGFloat = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoAlbumTV.delegate = self
        photoAlbumTV.dataSource = self
    }
    
    @IBAction func addRandomPhotoBtn(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func editingBtn(_ sender: UIBarButtonItem) {
    }
}

extension PhotoAlbumViewController: UICollectionViewDelegate {
    
}

extension PhotoAlbumViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! CollectionViewCell
        
        cell.photoIv.image = UIImage(named: photos[indexPath.row])
        
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

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoIv: UIImageView!
}

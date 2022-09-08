//
//  PhotoAlbumViewControllerExtensions.swift
//  Travel
//
//  Created by Jessica Ernst on 04.09.22.
//

import UIKit

// MARK: - Table view data source
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedItem = sender as? String else {
            return
        }
        if segue.identifier == "detail" {
            guard let destinationVC = segue.destination as?
                    PhotoDetailViewController else {
                return
            }
            
            destinationVC.selectedPhoto = selectedItem
        }
    }
}

// MARK: - Table view delegate flow layout
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

// MARK: - Table view delegate
extension PhotoAlbumViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !isEditing {
            let selectedPhoto = rndPhoto[indexPath.item]
            self.performSegue(withIdentifier: "detail", sender: selectedPhoto)
        }
    }
}

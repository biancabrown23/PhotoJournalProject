//
//  ViewController.swift
//  PhotoJournal
//
//  Created by Bianca Brown on 10/8/19.
//  Copyright © 2019 Bee. All rights reserved.
//

  import UIKit

class AddPhotoEntryViewController: UIViewController {
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
}

extension AddPhotoEntryViewController: PhotoVCDelegate {
    func showActionView(tag: Int) {
        // making an action sheet to edit and delete :) 
    }
    
    
}

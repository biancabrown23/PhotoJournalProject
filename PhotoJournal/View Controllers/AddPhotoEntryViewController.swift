//
//  ViewController.swift
//  PhotoJournal
//
//  Created by Bianca Brown on 10/8/19.
//  Copyright © 2019 Bee. All rights reserved.
//

// TODO: Segue to settings menu via setting button.

  import UIKit

class AddPhotoEntryViewController: UIViewController {
    
    
    // MARK: -- Outlets
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    // MARK: -- Functions
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let userEntryVC = storyboard.instantiateViewController(identifier: "userEntryVC") as? UserEntriesViewController else {return}
        userEntryVC.modalPresentationStyle = .currentContext
        // what is this doing to my button?
        present(userEntryVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()
    }
    
}

// MARK: -- Extensions
extension AddPhotoEntryViewController: PhotoVCDelegate {
    func showActionView(tag: Int) {
        // making an action sheet to edit and delete :) 
    }
    
    
}

//
//  UserEntriesViewController.swift
//  PhotoJournal
//
//  Created by Bianca Brown on 10/9/19.
//  Copyright © 2019 Bee. All rights reserved.
//

import UIKit

class UserEntriesViewController: UIViewController {
    
    var image = UIImage() {
        didSet {
            photoImageOutlet.image = image
        }
    }
    
    // MARK: -- Outlets
    @IBOutlet weak var photoImageOutlet: UIImageView!
    
    @IBOutlet weak var photoDescOutlet: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: -- Toolbar Functions
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func photoLibraryButtonPressed(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func cameraButtonPressed(_ sender: UIBarButtonItem) {
        let camera = UIImagePickerController()
        camera.delegate = self
        camera.sourceType = .camera
        present(camera, animated: true, completion: nil)
        // This feature is not applicable on this device. Please do not use. 
    }
    
    
}

// MARK: -- Extensions

extension UserEntriesViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           guard let image = info[.originalImage] as? UIImage else {
               //couldn't get image
               return
           }
           self.image = image
           dismiss(animated: true, completion: nil)
       }
}

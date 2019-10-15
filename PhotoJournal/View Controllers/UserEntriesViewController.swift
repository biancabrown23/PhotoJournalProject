//
//  UserEntriesViewController.swift
//  PhotoJournal
//
//  Created by Bianca Brown on 10/9/19.
//  Copyright © 2019 Bee. All rights reserved.
//

// TODO List: Building functionality to save button with using persistence. Save photo entries to the collection view using file manager. Add validations to the save button with UIAlertController. 

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
        print(PersistenceHelper<PhotoEntry>.documentsDirectory())
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
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        guard let image = photoImageOutlet.image else {return}
        guard let data = image.pngData() else {return}
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.long
        formatter.timeStyle = .medium
        let timeStamp = formatter.string(from: date)
        
        let captionLabel = photoDescOutlet.text ?? ""
        let newPhotoEntry = PhotoEntry.init(photo: data, description: captionLabel, date: timeStamp)
      
        do {
            try ImagePersistenceHelper.manager.save(newPhoto: newPhotoEntry)
            dismiss(animated: true, completion: nil)
        } catch {
            print(error)
        }
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

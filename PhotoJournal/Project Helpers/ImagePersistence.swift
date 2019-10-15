//
//  ImagePersistence.swift
//  PhotoJournal
//
//  Created by Bianca Brown on 10/9/19.
//  Copyright © 2019 Bee. All rights reserved.
//

import Foundation

class ImagePersistenceHelper {
  static let manager = ImagePersistenceHelper()
    private let persistenceHelper = PersistenceHelper<PhotoEntry>.init(fileName: "PhotoEntries.plist")

    func save(newPhoto: PhotoEntry) throws {
        try persistenceHelper.save(newElement: newPhoto)
    }
    
    // TODO - a function for Delete photos.
    // TODO - a function for fetching photos.
    // TODO - a function for saving edits.
    
    
  private init() {}
}

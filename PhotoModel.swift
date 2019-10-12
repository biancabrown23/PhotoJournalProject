//
//  PhotoModel.swift
//  PhotoJournal
//
//  Created by Bianca Brown on 10/9/19.
//  Copyright © 2019 Bee. All rights reserved.
//

import Foundation

struct PhotoEntry: Codable {
  let photo: Data
  let description: String
  let createdAt: String
}

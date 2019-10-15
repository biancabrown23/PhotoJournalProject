//
//  PersistenceHelper.swift
//  PhotoJournal
//
//  Created by Bianca Brown on 10/9/19.
//  Copyright © 2019 Bee. All rights reserved.
//

import Foundation

struct PersistenceHelper<T: Codable> {
    func getObjects() throws -> [T] {
        guard let data = FileManager.default.contents(atPath: url.path) else {
            return []
        }
        return try PropertyListDecoder().decode([T].self, from: data)
    }
    
    func save(newElement: T) throws {
        var elements = try getObjects()
        elements.append(newElement)
        try replace(elements: elements)
    }
    
    func replace(elements: [T]) throws {
      let serializedData = try PropertyListEncoder().encode(elements)
      try serializedData.write(to: url, options: Data.WritingOptions.atomic)
    }
    
    init(fileName: String){
        self.fileName = fileName
    }
    
    private let fileName: String
    
    private var url: URL {
        return filePathFromDocumentsDirectory(name: fileName)
    }
    
    static func documentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    private func filePathFromDocumentsDirectory(name: String) -> URL {
        return PersistenceHelper<T>.documentsDirectory().appendingPathComponent(name)
    }
    
}

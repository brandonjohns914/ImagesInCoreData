//
//  MyImagesContainer.swift
//  ImagesInCoreDataTutorial
//
//  Created by Brandon Johns on 4/9/24.
//

import Foundation
import CoreData

class MyImagesContainer {
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "ImagesDataModel")
        container.loadPersistentStores { _, error in
         
            if let error {
                print(error.localizedDescription)
        }
        }
    }
}

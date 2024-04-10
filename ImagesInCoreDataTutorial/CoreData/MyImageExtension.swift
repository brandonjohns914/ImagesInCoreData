//
//  MyImageExtension.swift
//  ImagesInCoreDataTutorial
//
//  Created by Brandon Johns on 4/9/24.
//

import Foundation
import UIKit
extension MyImage {
    var nameView: String {
//        get { name ?? "" }
//        set { name = newValue }
        name ?? ""
    }
    
    var imageID: String {
//        get {id ?? "" }
//        set {id = newValue }
        
        id ?? ""
    }
    
    var uiImage: UIImage {
        
        if !imageID.isEmpty, let image = FileManager().retrieveImage(with: imageID) {
                return image
        } else {
            return UIImage(systemName: "photo")!
        }
    }
    
}

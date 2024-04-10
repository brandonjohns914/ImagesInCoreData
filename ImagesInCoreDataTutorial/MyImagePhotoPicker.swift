//
//  MyImagePhotoPicker.swift
//  ImagesInCoreDataTutorial
//
//  Created by Brandon Johns on 4/10/24.
//

import SwiftUI
import PhotosUI

struct MyImagePhotoPicker: View {
    @StateObject private var imagePicker = ImagePicker()
    var body: some View {
       
            PhotosPicker("New Image",
                         selection: $imagePicker.imageSelection,
                         matching: .images,
                         photoLibrary: .shared()
            )
            .buttonStyle(.borderedProminent)
        
    }
}

#Preview {
    MyImagePhotoPicker()
}

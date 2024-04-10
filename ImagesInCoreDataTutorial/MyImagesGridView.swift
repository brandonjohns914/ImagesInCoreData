//
//  MyImagesGridView.swift
//  ImagesInCoreDataTutorial
//
//  Created by Brandon Johns on 4/9/24.
//

import SwiftUI
import PhotosUI

struct MyImagesGridView: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)])
    private var myImages: FetchedResults<MyImage>
    
    @StateObject private var imagePicker = ImagePicker()
    
    
    var body: some View {
        NavigationStack{
            Group {
                if !myImages.isEmpty {
                    ///
                } else {
                    Text("Select your first image")
                }
            }
            .navigationTitle("My Images")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    PhotosPicker("New Image",
                                 selection: $imagePicker.imageSelection,
                                 matching: .images,
                                 photoLibrary: .shared()
                    )
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

#Preview {
    MyImagesGridView()
}

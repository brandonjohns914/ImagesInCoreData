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
    @State private var formType: FormType?
    let columns = [GridItem(.adaptive(minimum: 100))]
    @StateObject private var imagePicker = ImagePicker()
    
    
    var body: some View {
        NavigationStack{
            Group {
                if !myImages.isEmpty {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(myImages) { myImage in
                                Button {
                                    formType = .update(MyImage)
                                } label: {
                                    VStack {
                                        Image(uiImage: myImage.uiImage)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                            .clipped()
                                            .shadow(radius: 5.0)
                                        Text(myImage.nameView)
                                    }
                                }
                            }
                        }
                    }
                } else {
                    Text("Select your first image")
                }
            }
            .navigationTitle("My Images")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    PhotosPicker("New Image",
                                 selection: $imagePicker.imageSelection,
                                 matching: .images,
                                 photoLibrary: .shared()
                    )
                    .buttonStyle(.borderedProminent)
                }
            }
            .onChange(of: imagePicker.uiImage) { _, newImage in
                if let newImage {
                    formType = .new(newImage)
                }
            }
            .sheet(item: $formType) { $0 }
        }
    }
}

#Preview {
    MyImagesGridView()
}



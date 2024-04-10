//
//  ImageFormView.swift
//  ImagesInCoreDataTutorial
//
//  Created by Brandon Johns on 4/9/24.
//

import PhotosUI
import SwiftUI

struct ImageFormView: View {
    @ObservedObject var viewModel: FormViewModel
    @Environment(\.dismiss) var dismiss
    @StateObject var imagePicker = ImagePicker()
    var body: some View {
        NavigationStack {
            VStack {
                Image(uiImage: viewModel.uiImage)
                    .resizable()
                    .scaledToFit()
                
                TextField("Image Name", text: $viewModel.name)
                    .textFieldStyle(.roundedBorder)
                
                
                HStack {
                    if viewModel.updating {
                        PhotosPicker("Change Image",
                                     selection: $imagePicker.imageSelection ,
                                     matching: .images,
                                     photoLibrary: .shared()
                        )
                        .buttonStyle(.bordered)
                    }
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                    .disabled(viewModel.incomplete)
                }
                Spacer()
         
            }
            .padding()
            .navigationTitle(viewModel.updating ? "Update Image" : "New Image")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .buttonStyle(.bordered)
                }
                if viewModel.updating {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            
                        } label: {
                            Image(systemName: "trash")
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                    }
                }
            }
            .onChange(of: imagePicker.uiImage) { _ , newImage in
                if let newImage{
                    viewModel.uiImage = newImage
                }
                
            }
        }
    }
}

#Preview {
    ImageFormView(viewModel: FormViewModel(UIImage(systemName: "photo")!))
}

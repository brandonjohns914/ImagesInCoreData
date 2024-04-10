//
//  ImagesInCoreDataTutorialApp.swift
//  ImagesInCoreDataTutorial
//
//  Created by Brandon Johns on 4/9/24.
//

import SwiftUI
import CoreData
@main
struct ImagesInCoreDataTutorialApp: App {
  
    var body: some Scene {
        WindowGroup {
            MyImagesGridView()
                .environment(\.managedObjectContext, MyImagesContainer().container.viewContext)
                .onAppear {
                    print(URL.documentsDirectory.path)
                }
        }
    }
}

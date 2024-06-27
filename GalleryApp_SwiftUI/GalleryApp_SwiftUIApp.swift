//
//  GalleryApp_SwiftUIApp.swift
//  GalleryApp_SwiftUI
//
//  Created by Amit SDE  on 27/06/24.
//

import SwiftUI

@main
struct GalleryApp_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView( picsViewModel: PicsViewModel())
        }
    }
}

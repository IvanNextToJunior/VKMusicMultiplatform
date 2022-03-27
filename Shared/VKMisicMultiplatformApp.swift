//
//  VKMisicMultiplatformApp.swift
//  Shared
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import SwiftUI

@main
struct VKMisicMultiplatformApp: App {
    
    var body: some Scene {
        WindowGroup {
#if os(macOS)
            ContentView()
                .frame(minWidth: 400,
                       maxWidth: .infinity,
                       minHeight: 400,
                       maxHeight: .infinity,
                       alignment: .center)
                .padding(16)
#else
            ContentView()
                .padding(16)
#endif
        }
        
    }
}

//
//  ContentView.swift
//  Shared
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var preferences = Preferences.shared
    
    var body: some View {
        if preferences.accessToken == nil || preferences.accessToken!.isEmpty {
            LoginView()
        } else {
            AudiosView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

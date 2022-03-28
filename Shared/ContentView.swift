//
//  ContentView.swift
//  Shared
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if Preferences.shared.accessToken == nil {
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

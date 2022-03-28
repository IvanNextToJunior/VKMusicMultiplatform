//
//  ContentView.swift
//  Shared
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var showsAudios = false
    var audiosFetcher = AudiosFetcher()
    
    var body: some View {
        if Preferences.shared.accessToken == nil {
            LoginView()
        } else {
            AudiosView().environmentObject(audiosFetcher)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

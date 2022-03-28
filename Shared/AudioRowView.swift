//
//  AudioRowView.swift
//  VKMisicMultiplatform
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import SwiftUI

struct AudioRowView: View {
    
    @State var title: String
    @State var artist: String
    @State var isPlaying = false
    
    var body: some View {
        HStack {
            Button(action: {
                isPlaying.toggle()
            }) {
                Image(systemName: isPlaying ? "pause.circle" : "play.circle")
            }
            .buttonStyle(BorderlessButtonStyle())
            .font(.largeTitle)
            
            VStack(alignment: .leading) {
                Text(title).bold()
                Text(artist).foregroundColor(.gray)
            }
        }
    }
}

struct AudioRowView_Previews: PreviewProvider {
    static var previews: some View {
        AudioRowView(title: "title", artist: "artist")
    }
}

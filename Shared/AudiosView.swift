//
//  AudiosView.swift
//  VKMisicMultiplatform
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import SwiftUI

struct AudiosView: View {
    
    @EnvironmentObject var audiosFetcher: AudiosFetcher
    
    var body: some View {
        List {
            ForEach(audiosFetcher.audios, id: \.id) { audio in
                AudioRowView(title: audio.title, artist: audio.artist)
                Divider()
            }
        }.onAppear {
            audiosFetcher.fetchAudios()
        }
    }
}

struct AudiosView_Previews: PreviewProvider {
    static var previews: some View {
        AudiosView()
    }
}

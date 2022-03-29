//
//  AudiosView.swift
//  VKMisicMultiplatform
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import SwiftUI

struct AudiosView: View {
    
    @StateObject var audiosFetcher = AudiosFetcher()
    
    var body: some View {
        List {
            ForEach(audiosFetcher.audioItems.items) { item in
                AudioRowView(
                    audiosFetcher: audiosFetcher,
                    audioItem: item
                )
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

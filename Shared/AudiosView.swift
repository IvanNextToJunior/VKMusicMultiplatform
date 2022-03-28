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
            ForEach(audiosFetcher.audioItems.items, id: \.id) { item in
                AudioRowView(
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

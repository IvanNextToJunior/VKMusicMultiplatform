//
//  AudiosView.swift
//  VKMisicMultiplatform
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import SwiftUI

struct AudiosView: View {
    
    @ObservedObject var audiosFetcher = AudiosFetcher()
    
    var body: some View {
        List {
            ForEach(audiosFetcher.audioItems.items.indices, id: \.self) { index in
                AudioRowView(
                    audioItem: audiosFetcher.audioItems.items[index]
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

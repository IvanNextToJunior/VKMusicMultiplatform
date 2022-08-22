//
//  AudiosView.swift
//  VKMisicMultiplatform
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import SwiftUI

struct AudiosView: View {
    
    @State var error: VKResponseError?
    @StateObject var audiosFetcher = AudiosFetcher()
    @StateObject var playingAudioStore = PlayingAudioStore()
    @StateObject var player = Player()
    
    var body: some View {
        List {
            ForEach(audiosFetcher.audioItems.items) { item in
                AudioRowView(
                    audioItem: item, playingAudioStore: playingAudioStore, player: player
                )
                Divider()
            }
        }.onAppear {
            audiosFetcher.fetchAudios()
        }.alert(audiosFetcher.error?.error_msg ?? "", isPresented: .constant(audiosFetcher.error != nil)) {
            Button("OK", role: .cancel) { }
        }
    }
}

struct AudiosView_Previews: PreviewProvider {
    static var previews: some View {
        AudiosView()
    }
}

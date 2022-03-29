//
//  AudioRowView.swift
//  VKMisicMultiplatform
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import SwiftUI

struct AudioRowView: View {

    @ObservedObject var audioItem: AudioItem
    @StateObject var playingAudioStore: PlayingAudioStore
    @StateObject var player: Player
    
    private static var durationFormatter: DateComponentsFormatter {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        return formatter
    }
    
    private var isPlayingAudio: Bool {
        playingAudioStore.playingAudio == audioItem
    }
    
    private var duration: Int {
        player.remainedSeconds == 0
            ? audioItem.audio.duration
            : isPlayingAudio
                ? player.remainedSeconds
                : audioItem.audio.duration
    }
    
    var body: some View {
        HStack {
            Button(action: {
                playingAudioStore.playingAudio = isPlayingAudio ? nil : audioItem
                
                if isPlayingAudio {
                    player.play(item: audioItem)
                } else {
                    player.stop()
                }
            }) {
                Image(systemName: isPlayingAudio ? "pause.circle" : "play.circle")
            }
            .buttonStyle(BorderlessButtonStyle())
            .font(.largeTitle)
            
            VStack(alignment: .leading) {
                Text(audioItem.audio.title).bold()
                Text(audioItem.audio.artist).foregroundColor(.gray)
            }
            
            Spacer()
            
            Text(formatDuration(duration))
                .foregroundColor(.gray)
        }
    }
    
    private func formatDuration(_ duration: Int) -> String {
        return Self.durationFormatter.string(from: TimeInterval(duration))!
    }
}

struct AudioRowView_Previews: PreviewProvider {
    static var previews: some View {
        AudioRowView(audioItem: AudioItem(), playingAudioStore: PlayingAudioStore(), player: Player())
    }
}

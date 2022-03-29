//
//  Player.swift
//  VKMisicMultiplatform
//
//  Created by Alexander Kormanovsky on 29.03.2022.
//

import Foundation
import AVFoundation
import SwiftUI

class Player: ObservableObject {
    
    var player: AVPlayer?
    @Published var remainedSeconds = 0
    
    /// We pass duration here because AVPlayer can report undefined duration for `currentItem.duration`
    func play(item: AudioItem) {
        let audio = item.audio
        
        if let url = URL(string: audio.url) {
            player = AVPlayer(url: url)
            guard let player = player else { return }
            
            player.addPeriodicTimeObserver(
                forInterval: CMTime(value: CMTimeValue(1), timescale: 2),
                queue: .main) { progressTime in
                    let currentSeconds = Int(CMTimeGetSeconds(progressTime))
                    self.remainedSeconds = Int(audio.duration - currentSeconds)
            }
            
            player.play()
        }
    }
    
    func stop() {
        player?.pause()
    }
    
}

//
//  Player.swift
//  VKMisicMultiplatform
//
//  Created by Alexander Kormanovsky on 29.03.2022.
//

import Foundation
import AVFoundation

class Player: ObservableObject {
    
    var player: AVPlayer?
    
    func play(url: String) {
        if let url = URL(string: url) {
            player = AVPlayer(url: url)
            player?.play()
        }
    }
    
    func stop() {
        player?.pause()
    }
    
}

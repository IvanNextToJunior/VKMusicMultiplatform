//
//  PlayingAudioStore.swift
//  VKMisicMultiplatform
//
//  Created by Alexander Kormanovsky on 29.03.2022.
//

import Foundation
import Combine

class PlayingAudioStore: ObservableObject {
    
    @Published var playingAudio: AudioItem?
    
}

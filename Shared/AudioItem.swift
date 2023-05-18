//
//  AudioItem.swift
//  VKMisicMultiplatform (iOS)
//
//  Created by Ivan2 on 18.05.2023.
//

import Foundation
import Combine

class AudioItem: ObservableObject, Identifiable, Equatable {
    
    static func == (lhs: AudioItem, rhs: AudioItem) -> Bool {
        lhs.id == rhs.id && lhs.audio == rhs.audio
    }
    
    var id = UUID()
    var audio = Audio()
    
    init() {
    }
    
    init(audio: Audio) {
        self.audio = audio
    }
}

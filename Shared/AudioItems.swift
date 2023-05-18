//
//  AudioItems.swift
//  VKMisicMultiplatform (iOS)
//
//  Created by Ivan2 on 18.05.2023.
//

import Foundation
import Combine
class AudioItems: ObservableObject {
    @Published var items: [AudioItem]
    
    init() {
        self.items = []
    }
    
    init(audios: [Audio]) {
        items = []
        
        for audio in audios {
            let audioItem = AudioItem(audio: audio)
            items.append(audioItem)
        }
    }
    
}


//
//  AudiosResponse.swift
//  VKMisicMultiplatform
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import Foundation
import Combine

struct Audio: Decodable, Identifiable, Equatable {
    let id = UUID()
    var artist = ""
    var title = ""
    var duration = 0
    var url = ""
}

struct Audios: Decodable {
    var count: Int
    var items: [Audio]
}

struct AudiosResponse: Decodable {
    var response: Audios?
    var error: VKResponseError?
}

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

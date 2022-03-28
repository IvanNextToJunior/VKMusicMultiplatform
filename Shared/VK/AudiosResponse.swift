//
//  AudiosResponse.swift
//  VKMisicMultiplatform
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import Foundation
import Combine

struct Audio: Decodable, Identifiable {
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
    var response: Audios
}

class AudioItem: ObservableObject, Identifiable {
    var id = UUID()
    var audio = Audio()
    @Published var isPlaying = false
    
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
        self.items = audios.map {
            AudioItem(audio: $0)
        }
    }
}

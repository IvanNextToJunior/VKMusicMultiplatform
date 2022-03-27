//
//  AudiosResponse.swift
//  VKMisicMultiplatform
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import Foundation

struct Audio: Decodable, Identifiable {
    let id = UUID()
    var artist: String
    var title: String
    var duration: Int
    var url: String
}

struct Audios: Decodable {
    var count: Int
    var items: [Audio]
}

struct AudiosResponse: Decodable {
    var response: Audios
}

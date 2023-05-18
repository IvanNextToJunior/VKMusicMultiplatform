//
//  Audio.swift
//  VKMisicMultiplatform (iOS)
//
//  Created by Ivan2 on 18.05.2023.
//

import Foundation
struct Audio: Decodable, Identifiable, Equatable {
    let id = UUID()
    var artist = ""
    var title = ""
    var duration = 0
    var url = ""
}

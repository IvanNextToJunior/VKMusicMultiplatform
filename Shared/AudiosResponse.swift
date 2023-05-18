//
//  AudiosResponse.swift
//  VKMisicMultiplatform
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import Foundation

struct AudiosResponse: Decodable {
    var response: Audios?
    var error: VKResponseError?
}

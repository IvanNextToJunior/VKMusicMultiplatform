//
//  TwoFactorAuthorizationResponse.swift
//  VKMisicMultiplatform
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import Foundation

struct VKResponseError: Decodable {
    var error_code: Int
    var error_msg: String
    var error_text: String?
}

struct TwoFactorAuthorizationResponse: Decodable {
    var error: VKResponseError?
    var response: Int?
}

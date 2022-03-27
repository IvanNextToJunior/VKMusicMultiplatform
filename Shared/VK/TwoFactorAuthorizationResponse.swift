//
//  TwoFactorAuthorizationResponse.swift
//  VKMisicMultiplatform
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import Foundation

struct TwoFactorAuthorizationResponseError: Decodable {
    var error_code: Int
    var error_msg: String
    var error_text: String
}

struct TwoFactorAuthorizationResponse: Decodable {
    var error: TwoFactorAuthorizationResponseError?
    var response: Int?
}

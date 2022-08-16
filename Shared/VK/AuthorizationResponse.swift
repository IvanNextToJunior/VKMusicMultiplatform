//
//  AuthorizationResponse.swift
//  VKMisicMultiplatform
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import Foundation

struct AuthorizationResponse: Decodable {
    var error: String?
    var error_description: String?
    var validation_sid: String?
    var validation_type: String?
    var phone_mask: String?
    var user_id: Int?
    var access_token: String?
    var webview_refresh_token: String?
    var webview_access_token: String?
    var webview_access_token_expires_in: String?
    var expires_in: Int?
    var trusted_hash: String?
    var captcha_sid: String?

}

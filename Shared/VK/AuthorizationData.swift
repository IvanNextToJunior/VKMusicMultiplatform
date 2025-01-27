//
//  AuthorizationData.swift
//  VKMisicMultiplatform
//
//  Created by Alexander Kormanovsky on 21.08.2022.
//

import Foundation

struct AuthorizationData {
    
    var token = ""
    
    var needValidation = false
    var validationSid = ""
    
    var needCaptcha = false
    var captchaSid = ""
    var captchaImage = ""
    
    var is2FAApp = false
    var errorMessage = ""
    
}

//
//  TwoFactorAuthorizationHelper.swift
//  VKMisicMultiplatform
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import Foundation
import Alamofire

/// https://github.com/vodka2/vkaudiotoken-python/blob/master/src/vkaudiotoken/TwoFAHelper.py
struct TwoFactorAuthorizationHelper {
    
    static func validatePhone(validationSid: String, completion: @escaping (Bool) -> Void) {
        let url = URLQuery.buildURL(baseURL: "https://api.vk.com/method/auth.validatePhone", params: [
            "sid" : validationSid,
            "v" : "5.95"
        ])!
        AF.request(url).responseDecodable(of: TwoFactorAuthorizationResponse.self) { response in
            switch response.result {
            case let .success(authResponse):
                if let _ = authResponse.response {
                    completion(true)
                    return
                }

                if let error = authResponse.error {
                    print(error)
                    completion(false)
                    return
                }

                print("Unknown validation error")
                
                completion(false)

            case let .failure(error):
                print(error)
            }
        }.responseString { response in
            print("2FA validation response:\n\(response)")
        }
          
    }
    
}

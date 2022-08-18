//
//  ValidationView.swift
//  VKMisicMultiplatform
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import SwiftUI

/// https://dev.vk.com/api/direct-auth#%D0%94%D0%B2%D1%83%D1%85%D1%84%D0%B0%D0%BA%D1%82%D0%BE%D1%80%D0%BD%D0%B0%D1%8F%20%D0%B0%D1%83%D1%82%D0%B5%D0%BD%D1%82%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F
struct ValidationView: View {
    
    @State var login: String
    @State var password: String
    @State var validationCode = ""
    
    @ObservedObject var preferences = Preferences.shared
    
    var body: some View {
        
        VStack {
            TextField("Enter validation code", text: $validationCode)
            Button("Submit") {
               //MARK: Get token
                let tokenReceiver = TokenReceiver(
                    login: login,
                    password: password,
                    validationCode: validationCode,
                    client: VKClient.officialClient)
                tokenReceiver.getToken { token, needValidation, validationSid, is2FAApp in
                    preferences.accessToken = token
                    preferences.captcha = validationSid
                }
            }
        }
    }
}

struct ValidationView_Previews: PreviewProvider {
    static var previews: some View {
        ValidationView(login: "", password: "")
    }
}

//
//  LoginView.swift
//  VKMisicMultiplatform
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import SwiftUI

struct LoginView: View {
    
    @State var login = ""
    @State var password = ""
    @State var showsValidationScreen = false
    
    var body: some View {
        if showsValidationScreen {
            
            //MARK: ValidationView initialization
            ValidationView(login: login, password: password)
        } else {
            VStack {
                TextField("Login", text: $login)
                TextField("Password", text: $password)
                HStack {
                    Button("Login") {
                        let tokenReceiver = TokenReceiver(login: login, password: password, client: VKClient.officialClient)
                        tokenReceiver.getToken { token, needValidation, validationSid, is2FAApp in
                            if needValidation {
                                if is2FAApp! {
                                    showsValidationScreen = true
                                    CaptchaView()
                                } else {
                                    TwoFactorAuthorizationHelper.validatePhone(validationSid: validationSid!) { success in
                                        showsValidationScreen = true
                                    }
                                }
                                
                                return
                            }
                            
                            print(token ?? "")
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

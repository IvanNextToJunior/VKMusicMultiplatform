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
    @State var showsValidationView = false
    @State var validationCode = ""
    @State var showsErrorAlert = false
    @State var errorMessage = ""
    @State var captchaSid = ""
    @State var captchaKey = ""
    @State var shouldApplyCaptcha = false
    @ObservedObject var preferences = Preferences.shared
    var body: some View {
        if showsValidationView {
            ValidationView(
                login: login,
                password: password,
                validationCode: $validationCode
            )
        } else if (!captchaSid.isEmpty) {
            CaptchaView(login: login,
                        password: password,
                        validationCode: $validationCode,
                        captchaKey: $captchaKey,
                        captchaSid: $captchaSid,
                        shouldApplyCaptcha: $shouldApplyCaptcha
            )
        } else {
            VStack {
                TextField("Login", text: $login)
                TextField("Password", text: $password)
                HStack {
                    Button("Login") {
                        let tokenReceiver = TokenReceiver(
                            login: login,
                            password: password,
                            client: VKClient.officialClient)
                        tokenReceiver.getToken { authorizationData in
                            
                            // handle errors
                            
                            errorMessage = authorizationData.errorMessage
                            showsErrorAlert = !errorMessage.isEmpty
                            preferences.accessToken = authorizationData.token
                            if showsErrorAlert {
                                return
                            }
                            
                            // handle validation
                            
                            if authorizationData.needValidation {
                                if authorizationData.is2FAApp {
                                    showsValidationView = true
                                } else {
                                    TwoFactorAuthorizationHelper.validatePhone(validationSid: authorizationData.validationSid) { success in
                                        showsValidationView = true
                                    }
                                }
                                
                                return
                            }
                            
                            // handle captcha
                            
                            if authorizationData.needCaptcha {
                                captchaSid = authorizationData.captchaSid
                                return
                            }
                            
                            // got token
                            
                            print("Token successfully received", authorizationData.token)
                        }
                    }
                    Spacer()
                }
            }.alert(errorMessage, isPresented: $showsErrorAlert) {
                Button("OK", role: .cancel) { }
            }
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

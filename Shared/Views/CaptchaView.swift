//
//  CaptchaView.swift
//  VKMisicMultiplatform
//
//  Created by Galina on 13.08.2022.
//

import SwiftUI
import SDWebImageSwiftUI
import Alamofire

struct CaptchaView: View {
  
    @State var login = ""
    @State var password = ""
    @State var showsErrorAlert = false
    @State var errorMessage = ""
    
    @Binding var validationCode: String
    @Binding var captchaKey: String
    @Binding var captchaSid: String
    @Binding var shouldApplyCaptcha: Bool
    
    @ObservedObject var preferences = Preferences.shared
    
    var body: some View {
        WebImage(url: URL(string: "https://api.vk.com/captcha.php?sid=\($captchaSid)")!).scaledToFit()
            TextField("Введите текст с картинки", text: $captchaKey)
        Button("Подтвердить") {
            shouldApplyCaptcha = true
            
            let tokenReceiver = TokenReceiver(
                login: login,
                password: password,
                validationCode: validationCode,
                captchaSid: captchaSid,
                captchaKey: captchaKey,
                client: VKClient.officialClient)
            tokenReceiver.getToken { authorizationData in
                
                // handle errors
                
                errorMessage = authorizationData.errorMessage
                showsErrorAlert = !errorMessage.isEmpty
                
                if showsErrorAlert {
                    return
                }
                
                // got token
                
                preferences.accessToken = authorizationData.token
                
                print("Token successfully received", authorizationData.token)
            }
        }.alert(errorMessage, isPresented: $showsErrorAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

struct CaptchaView_Previews: PreviewProvider {
    static var previews: some View {
        CaptchaView(
            validationCode: .constant(""),
            captchaKey: .constant(""),
            captchaSid: .constant(""),
            shouldApplyCaptcha: .constant(false)
        )
    }
}

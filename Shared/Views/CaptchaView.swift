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
  
    @State var captcha_key = ""
    
    
    var body: some View {
        WebImage(url: URL(string: "https://api.vk.com/captcha.php?sid=\(Preferences.shared.captcha!)")!).scaledToFit()
            TextField("Введите текст с картинки", text: $captcha_key)
        Button("Подтвердить") {
           
         guard   let urlString = URLQuery.buildURL(baseURL: "https://oauth.vk.com/token", params: ["grant_type" : "password",
                                                                                        "client_id" : VKClient.officialClient.clientId,
                                                                                        "client_secret" : VKClient.officialClient.clientSecret,
                                                                                        "username" : LoginView().login,
                                                                                        "password" : LoginView().password,
                                                                                        "v" : "5.116",
                                                                                        "lang" : "en",
                                                                                        "scope" : "all",
                                                                                                   "captcha_sid": Preferences.shared.captcha!,
                                                                                                   "captcha_key": captcha_key]
    ),
                 let url = URL(string: urlString) else { return }
            let headers = HTTPHeaders(["User-Agent" : VKClient.officialClient.userAgent])
            
            AF.request(url, headers: headers).responseDecodable(of: AuthorizationResponse.self) { response in
                switch response.result {
                case let .success(authResponse):
                    if let token = authResponse.access_token {
                        Preferences.shared.accessToken = token
                        return
                    }

                case .failure(let err):
                  debugPrint(err)
                }
            
                    
        }
        
        }
        
    }
}

struct CaptchaView_Previews: PreviewProvider {
    static var previews: some View {
        CaptchaView()
    }
}

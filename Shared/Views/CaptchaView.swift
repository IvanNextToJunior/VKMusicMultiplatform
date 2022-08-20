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
           
         
        
        }
        
    }
}

struct CaptchaView_Previews: PreviewProvider {
    static var previews: some View {
        CaptchaView()
    }
}

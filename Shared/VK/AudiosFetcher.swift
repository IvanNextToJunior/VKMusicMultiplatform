//
//  AudiosFetcher.swift
//  VKMisicMultiplatform
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import Foundation
import SwiftUI
import Alamofire

class AudiosFetcher: ObservableObject {
    
    @Published var audioItems = AudioItems()
    @Published var error: VKResponseError?
    
    /// When getting "Token confirmation required" error:
    /// В настройках VK ID - безопасность и вход - защита от подозрительных приложений уберите
    /// https://github.com/vodka2/vk-audio-token/issues/41#issuecomment-1159586230
    /// Direct link: https://id.vk.com/account/#/security
    func fetchAudios() {
        let url = URL(string: URLQuery.buildURL(baseURL: "https://api.vk.com/method/audio.get", params: [
            "access_token" : Preferences.shared.accessToken!,
            "v" : "5.95"
        ])!)!
        let headers = HTTPHeaders(["User-Agent" : VKClient.officialClient.userAgent])
        
        AF.request(url, headers: headers).responseDecodable(of: AudiosResponse.self) { response in
            switch response.result {
            case let .success(audiosResponse):
                
                if let audios = audiosResponse.response {
                    self.audioItems = AudioItems(audios: audios.items)
                    return
                }
                
                if let error = audiosResponse.error {
                    self.error = error
                    print(error)
                }
                
            case let .failure(error):
                print(error)
            }
        }.responseString { str in
            print(str)
        }
    }
    
}

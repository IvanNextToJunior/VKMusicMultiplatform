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
    
    @ObservedObject var preferences = Preferences()
    @Published var audioItems = AudioItems()
    
    func fetchAudios() {
        let url = URL(string: URLQuery.buildURL(baseURL: "https://api.vk.com/method/audio.get", params: [
            "access_token" : preferences.accessToken!,
            "v" : "5.95"
        ])!)!
        let headers = HTTPHeaders(["User-Agent" : VKClient.officialClient.userAgent])
        
        AF.request(url, headers: headers).responseDecodable(of: AudiosResponse.self) { response in
            switch response.result {
            case let .success(audiosResponse):
                self.audioItems = AudioItems(audios: audiosResponse.response.items)
            case let .failure(error):
                print(error)
            }
        }
    }
    
}

//
//  Preferences.swift
//  VKMisicMultiplatform
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import Foundation
import Combine

class Preferences: ObservableObject {
    
    let userDefaults = UserDefaults.standard
    
    init() {
        accessToken = userDefaults.string(forKey: "accessToken") ?? ""
    }
    
    @Published var accessToken: String? {
        didSet {
            userDefaults.set(accessToken, forKey: "accessToken")
        }
    }
    
}

//
//  Preferences.swift
//  VKMisicMultiplatform
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import Foundation
import Combine

class Preferences: ObservableObject {
    
    static let shared = Preferences()
    
    private init() {
        accessToken = UserDefaults.standard.string(forKey: "accessToken")
    }
    
    @Published var accessToken: String? {
        didSet {
            UserDefaults.standard.set(accessToken, forKey: "accessToken")
        }
    }
    
}

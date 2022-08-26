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
    private let userDefaults = UserDefaults.standard
 
    
    @Published var accessToken: String?
    
    func save () {
        userDefaults.set(accessToken, forKey: "accessToken")
    }

}

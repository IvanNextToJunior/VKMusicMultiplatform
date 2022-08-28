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
   
    private init() {
        
    }
    
    @Published var accessToken: String?
    
    func save () {
        userDefaults.set(accessToken, forKey: "accessToken")
 
        if userDefaults.value(forKey: "accessToken") != nil {
            print("Value is \(userDefaults.value(forKey: "accessToken")!)")
        }
    
    }

}

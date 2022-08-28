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
    let userDefaults = UserDefaults.standard
   
    private init() {
          if let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first {
              print("Preferences path: \(path)/Preferences")
          }
          
        accessToken = userDefaults.string(forKey: "accessToken")
      }
    
    @Published var accessToken: String? {
        didSet {
           userDefaults.set(accessToken, forKey: "accessToken")
            if userDefaults.value(forKey: "accessToken") != nil {
                print("Value is: \(userDefaults.value(forKey: "accessToken")!)")
            }
        
        }
    }
    
   

}

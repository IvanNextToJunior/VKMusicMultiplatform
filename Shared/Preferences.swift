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
    
 
    
    @Published var accessToken: String?
    
    

}

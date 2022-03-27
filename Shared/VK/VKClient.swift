//
//  VKClient.swift
//  VKMisicMultiplatform (iOS)
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import Foundation

struct VKClient {
    var userAgent: String
    var clientSecret: String
    var clientId: String
    
    static let officialClient = VKClient(
        userAgent: "VKAndroidApp/5.52-4543 (Android 5.1.1; SDK 22; x86_64; unknown Android SDK built for x86_64; en; 320x240)",
        clientSecret: "hHbZxrka2uZ6jB1inYsH",
        clientId: "2274003"
    )
}

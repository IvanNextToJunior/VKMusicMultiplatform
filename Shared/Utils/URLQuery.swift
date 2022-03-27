//
//  URLQuery.swift
//  VKMisicMultiplatform
//
//  Created by Alexander Kormanovsky on 27.03.2022.
//

import Foundation

struct URLQuery {
    
    static func buildURL(baseURL: String, params: [String: String]) -> String? {
        guard var components = URLComponents(string: baseURL) else {
            return nil
        }
        
        let queryItems = params.map { element in
            URLQueryItem(name: element.key, value: element.value)
        }
        
        if var componentsQueryItems = components.queryItems {
            componentsQueryItems += queryItems
            components.queryItems = componentsQueryItems
        } else {
            components.queryItems = queryItems
        }

        return components.url?.absoluteString
    }
    
}

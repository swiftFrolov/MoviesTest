//
//  NetworkClient.swift
//  MoviesTest
//
//  Created by Val on 9/13/17.
//  Copyright © 2017 frolapps. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case wrongURL
    case unknown
}

class NetworkClient {
    enum NetworkResponse {
        case success(data: Data)
        case failure(error: Error)
    }
    
    private func addParametersToURL(url: String, parameters: [String: Any]) -> String {
        var url = url
        for parameter in parameters {
            url = url + "&" + parameter.key + "=" + String(describing: parameter.value)
        }
        return url
    }
    
    func makeRequest(forURL url: String, withParameters parameters: [String: Any], withComplitionHandler completionHandler: @escaping (NetworkResponse) -> Void) {
        guard let url = URL(string: addParametersToURL(url: url, parameters: parameters)) else {
            completionHandler(.failure(error: NetworkError.wrongURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                let error = error ?? NetworkError.unknown
                completionHandler(.failure(error: error))
                return
            }
            completionHandler(.success(data: data))
        }.resume()
    }
}

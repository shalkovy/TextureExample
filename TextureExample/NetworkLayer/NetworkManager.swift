//
//  NetworkManager.swift
//  TextureExample
//
//  Created by Dima Shelkov on 1/31/20.
//  Copyright © 2020 Dima Shelkov. All rights reserved.
//

import Foundation
import Moya

protocol Network {
    associatedtype T: TargetType
    var provider: MoyaProvider<T> { get }
}

struct NetworkManager: Network {
    let provider = MoyaProvider<ApiRouter>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    func getMovie(title: String, completion: @escaping (Movie)->()) {
        
        provider.request(.film(title: title)) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(Movie.self, from: response.data)
                    print(results)
                    completion(results)
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}

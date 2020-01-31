//
//  ApiRouter.swift
//  TextureExample
//
//  Created by Dima Shelkov on 1/31/20.
//  Copyright © 2020 Dima Shelkov. All rights reserved.
//

import Moya

enum ApiRouter {
    
    // MARK: - Endpoints
    case film(title: String)
}

extension ApiRouter: TargetType {
    
    var baseURL: URL {
        switch self {
        case .film: return URL(string: "http://www.omdbapi.com/")!
        }
    }
    
    var path: String {
        switch self {
        case .film: return ""
        }
    }
    
    var method: Method {
        switch self {
        case .film: return .get
        }
    }
    
    var sampleData: Data {
        return sampleData(fromFile: "\(path.replacingOccurrences(of: "/", with: "", options: NSString.CompareOptions.literal, range: nil)).json")
    }
    
    func sampleData(fromFile fileName: String) -> Data {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else { return Data() }
        return (try? Data(contentsOf: url)) ?? Data()
    }
    
    var task: Task {
        switch self {
        case .film(let title): return .requestParameters(parameters: ["t" : title, "apikey" : "8edb6b39"], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}

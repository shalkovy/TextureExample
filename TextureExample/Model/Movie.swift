//
//  Movie.swift
//  TextureExample
//
//  Created by Dima Shelkov on 1/31/20.
//  Copyright © 2020 Dima Shelkov. All rights reserved.
//

import Foundation

struct Movie {
    let title: String
    let posterURL: String
    let genre: String
    
    let released: String
    let director: String
    let actors: String
}

extension Movie: Decodable {
    enum MovieCodingKeys: String, CodingKey {
        case title = "Title"
        case posterURL = "Poster"
        case genre = "Genre"
        
        case released = "Released"
        case director = "Director"
        case actors = "Actors"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MovieCodingKeys.self)
        
        title = try container.decode(String.self, forKey: .title)
        posterURL = try container.decode(String.self, forKey: .posterURL)
        genre = try container.decode(String.self, forKey: .genre)
        
        released = try container.decode(String.self, forKey: .released)
        director = try container.decode(String.self, forKey: .director)
        actors = try container.decode(String.self, forKey: .actors)
    }
}

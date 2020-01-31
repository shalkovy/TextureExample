//
//  ImageNode.swift
//  TextureExample
//
//  Created by Dima Shelkov on 2/1/20.
//  Copyright © 2020 Dima Shelkov. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ImageNode: ASImageNode {
    
    var titleNode: ASTextNode
    var genreNode: ASTextNode
    
    override init() {
        titleNode = ASTextNode()
        genreNode = ASTextNode()
        super.init()
        contentMode = .scaleAspectFit
    }
    
    override func layoutIfNeeded() {
        self.view.addSubnode(titleNode)
        self.view.addSubnode(genreNode)
    }
    
    func configureWith(_ movie: Movie?) {
        guard let movie = movie, let url = URL(string: movie.posterURL) else { return }
        load(url: url)
    }
}

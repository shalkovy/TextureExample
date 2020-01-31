//
//  NodeButton.swift
//  TextureExample
//
//  Created by Dima Shelkov on 1/31/20.
//  Copyright © 2020 Dima Shelkov. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class NodeButton: ASButtonNode {
    override init() {
        super.init()
        backgroundColor = UIColor.systemBlue
        setTitle("Search", with: UIFont.standart(), with: .white, for: .normal)
        cornerRadius = 8
        clipsToBounds = true
    }
}

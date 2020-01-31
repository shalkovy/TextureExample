//
//  ASImageNode+Load.swift
//  TextureExample
//
//  Created by Dima Shelkov on 2/1/20.
//  Copyright © 2020 Dima Shelkov. All rights reserved.
//

import Foundation
import AsyncDisplayKit

extension ASImageNode {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

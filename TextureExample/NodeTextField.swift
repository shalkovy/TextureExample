//
//  NodeTextField.swift
//  TextureExample
//
//  Created by Dima Shelkov on 1/31/20.
//  Copyright © 2020 Dima Shelkov. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class NodeTextField: ASEditableTextNode {
    override init() {
        super.init(textKitComponents: ASTextKitComponents(attributedSeedString: nil, textContainerSize: CGSize.zero), placeholderTextKitComponents: ASTextKitComponents(attributedSeedString: nil, textContainerSize: CGSize.zero))
        backgroundColor = .white
        let attributes: [NSAttributedString.Key: Any] =
            [NSAttributedString.Key.font: UIFont.standart(),
             NSAttributedString.Key.foregroundColor: UIColor.gray]
        attributedPlaceholderText = NSAttributedString(string: "Type film name", attributes: attributes)
        typingAttributes = [NSAttributedString.Key.font.rawValue: UIFont.standart()]
        textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        cornerRadius = 8
        clipsToBounds = true
    }
}

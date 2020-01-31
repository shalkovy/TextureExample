//
//  MainViewController.swift
//  TextureExample
//
//  Created by Dima Shelkov on 1/30/20.
//  Copyright © 2020 Dima Shelkov. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class MainViewController: UIViewController, ASEditableTextNodeDelegate {
    
    private var searchTextField: NodeTextField
    private var searchButton: NodeButton
    
    required init() {
        searchTextField = NodeTextField()
        searchButton = NodeButton()
        super.init(nibName: nil, bundle: nil)
        searchTextField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        
        // add nodes
        self.view.addSubnode(searchTextField)
        self.view.addSubnode(searchButton)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        searchTextField.frame = CGRect(x: 20, y: 70, width: self.view.bounds.width - 40, height: 40)
        searchButton.frame = CGRect(x: 20, y: 120, width: self.view.bounds.width - 40, height: 60)
    }
}


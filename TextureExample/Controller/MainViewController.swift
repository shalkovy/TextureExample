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
    private var networkManager: NetworkManager
    private var imageNode: ImageNode
    
    required init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        searchTextField = NodeTextField()
        searchButton = NodeButton()
        imageNode = ImageNode()
        
        super.init(nibName: nil, bundle: nil)
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
        self.view.addSubnode(imageNode)
        
        // add selector to button
        searchButton.addTarget(self, action: #selector(searchButtonTapped), forControlEvents: .touchUpInside)
        imageNode.addTarget(self, action: #selector(showFullInfo), forControlEvents: .touchUpInside)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        searchTextField.frame = CGRect(x: 20, y: 70, width: self.view.bounds.width - 40, height: 40)
        searchButton.frame = CGRect(x: 20, y: 120, width: self.view.bounds.width - 40, height: 60)
        imageNode.frame = CGRect(x: 20, y: 200, width: self.view.bounds.width - 40, height: self.view.bounds.height - 220)
    }
    
    @objc private func searchButtonTapped() {
        self.searchTextField.resignFirstResponder()
        
        guard let text = searchTextField.textView.text, !text.isEmpty else { return }
        networkManager.getMovie(title: text) { [weak self] movie in
            self?.imageNode.configureWith(movie)
        }
    }
    
    @objc private func showFullInfo() {
        
    }
}

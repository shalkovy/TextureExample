//
//  AppDelegate.swift
//  TextureExample
//
//  Created by Dima Shelkov on 1/30/20.
//  Copyright © 2020 Dima Shelkov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let networkManager = NetworkManager()
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        window.rootViewController = MainViewController(networkManager: networkManager)
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}


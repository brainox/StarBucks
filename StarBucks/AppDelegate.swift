//
//  AppDelegate.swift
//  StarBucks
//
//  Created by Decagon on 11/08/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [ViewController()]
        
        window?.rootViewController = tabBarController
        return true
    }

}


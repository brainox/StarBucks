//
//  ViewController.swift
//  StarBucks
//
//  Created by Decagon on 11/08/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: "house.fill", withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: "Home", image: image, tag: 0)
    }


}


//
//  ViewController.swift
//  StarBucks
//
//  Created by Decagon on 11/08/2021.
//

import UIKit

class HomeViewController: StarBucksViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }
    
    override func commonInit() {
        setTabBarImage(image: "house.fill", title: "Home")
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Good Afternoon, Obinna"
    }
    
    
}


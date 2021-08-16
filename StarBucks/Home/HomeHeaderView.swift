//
//  HomeHeaderView.swift
//  StarBucks
//
//  Created by Decagon on 11/08/2021.
//

import UIKit

class HomeHeaderView: UIView {
    
    let greeting = UILabel()
    let inbox = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeHeaderView {
    func style() {
        backgroundColor = .white
        greeting.translatesAutoresizingMaskIntoConstraints = false
        greeting.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        greeting.text = "Good Afternoon, Obinna"
        greeting.numberOfLines = 0
        greeting.lineBreakMode = .byWordWrapping
        
       makeInboxButton()
    }
    
    func layout() {
        addSubview(greeting)
        addSubview(inbox)
        
        NSLayoutConstraint.activate([
            greeting.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            greeting.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: greeting.trailingAnchor, multiplier: 1),
            
            inbox.topAnchor.constraint(equalToSystemSpacingBelow: greeting.bottomAnchor, multiplier: 2),
            inbox.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: inbox.bottomAnchor, multiplier: 1),
            inbox.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25)
        ])
    }
}

extension HomeHeaderView {
    func makeInboxButton() {
        inbox.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: "envelope", withConfiguration: configuration)
        
        inbox.setImage(image, for: .normal)
        inbox.imageView?.tintColor = .secondaryLabel
        inbox.imageView?.contentMode = .scaleAspectFill
        
        inbox.setTitle("Inbox", for: .normal)
        inbox.setTitleColor(.secondaryLabel, for: .normal)
        
        inbox.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        inbox.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

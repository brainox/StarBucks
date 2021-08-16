//
//  StarRewardsRow.swift
//  StarBucks
//
//  Created by Decagon on 16/08/2021.
//

import UIKit

class StarRewardsRow: UIView {
    let starAndPoints = StarAndPoints()
    let descriptionLabel = UILabel()
    
    init(numberOfPoints: String, description: String) {
        starAndPoints.pointLabel.text = numberOfPoints
        descriptionLabel.text = description
        
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StarRewardsRow {
    func style() {
        starAndPoints.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 0
        descriptionLabel.sizeToFit()
    }
    
    func layout() {
        addSubview(starAndPoints)
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            starAndPoints.topAnchor.constraint(equalTo: topAnchor),
            starAndPoints.leadingAnchor.constraint(equalTo: leadingAnchor),
            starAndPoints.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: starAndPoints.trailingAnchor, constant: 4),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
}

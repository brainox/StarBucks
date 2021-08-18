//
//  BalanceView.swift
//  StarBucks
//
//  Created by Decagon on 14/08/2021.
//

import UIKit

class BalanceView: UIView {
    
    let pointslabel = UILabel()
    let starView = makeSymbolImageView(systemName: "star.fill")
    let starBalanceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func style() {
        pointslabel.translatesAutoresizingMaskIntoConstraints = false
        pointslabel.font = UIFont.preferredFont(forTextStyle: .largeTitle).bold()
        pointslabel.text = "12"
        
        starView.translatesAutoresizingMaskIntoConstraints = false
        starView.tintColor = .starYellow
        starView.contentMode = .scaleAspectFit
        
        starBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        starBalanceLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        starBalanceLabel.textColor = .label
        starBalanceLabel.text = "Star balance"
    }
    
    func layout() {
        addSubview(pointslabel)
        addSubview(starView)
        addSubview(starBalanceLabel)
        
        NSLayoutConstraint.activate([
            pointslabel.topAnchor.constraint(equalTo: topAnchor),
            pointslabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            starView.leadingAnchor.constraint(equalTo: pointslabel.trailingAnchor, constant: -2),
            starView.heightAnchor.constraint(equalToConstant: 15),
            starView.centerYAnchor.constraint(equalTo: pointslabel.centerYAnchor, constant: 4),
            starView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            starBalanceLabel.topAnchor.constraint(equalTo: pointslabel.bottomAnchor, constant: 0),
            starBalanceLabel.leadingAnchor.constraint(equalTo: pointslabel.leadingAnchor),
            starBalanceLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            starBalanceLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
}

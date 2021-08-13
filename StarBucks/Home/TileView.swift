//
//  TileView.swift
//  StarBucks
//
//  Created by Decagon on 13/08/2021.
//

import UIKit

class TileView: UIView {
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TileView {
    func style() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        
    }
}

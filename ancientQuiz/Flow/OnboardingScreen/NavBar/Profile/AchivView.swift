//
//  AchivView.swift

import Foundation
import UIKit
import SnapKit

class AchivView: UIView {
    
    private (set) var imageGods: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.shadowColor = UIColor(red: 1, green: 0.992, blue: 0.569, alpha: 0.45).cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowRadius = 11.2
        imageView.layer.shadowOffset = CGSize(width: 2, height: 3)
        return imageView
    }()
    
    init(frame: CGRect, image: UIImage) {
        super.init(frame: frame)
        imageGods.image = image
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [imageGods] .forEach(addSubview(_:))
    }
    
    private func setupConstraints() {
     
        imageGods.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
      
    }
}


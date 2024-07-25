//
//  HomeView.swift


import Foundation
import UIKit
import SnapKit

class HomeView: UIView {
    
    private (set) var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bgClassic
        return imageView
    }()
    
    
    private (set) var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "home".uppercased()
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.textColor = .green
        label.textAlignment = .center
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
   
        [bgImage, titleLabel] .forEach(addSubview(_:))
    }
    
    private func setupConstraints() {
     
        bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}


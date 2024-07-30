//
//  AchivView.swift

import Foundation
import UIKit
import SnapKit

class AchivView: UIView {
    
    private (set) var imageGods: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private (set) var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(font: .peralta, style: .regular, size: 16)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    
    init(frame: CGRect, image: UIImage, titleText: String) {
        super.init(frame: frame)
        imageGods.image = image
        titleLabel.text = titleText
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .green
        [imageGods, titleLabel] .forEach(addSubview(_:))
    }
    
    private func setupConstraints() {
     
        imageGods.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(8)
            make.width.equalTo(94)
            make.height.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageGods.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(8)
        }
    }
}


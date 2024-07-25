//
//  OnboardingScreenView.swift

import Foundation
import UIKit
import SnapKit

class OnboardingScreenView: UIView {
    
    private (set) var bgImage: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = .bgOther
        return imageView
    }()
    
    
    private (set) var titleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Loading", font: .customFont(font: .joti, style: .regular, size: 20), textColor: .red, paragraphSpacing: 1, lineHeightMultiple: 0.96)
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
   
        [bgImage] .forEach(addSubview(_:))
    }
    
    private func setupConstraints() {
     
        bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
}

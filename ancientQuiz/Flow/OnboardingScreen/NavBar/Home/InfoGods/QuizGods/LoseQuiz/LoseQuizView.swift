//
//  LoseQuizView.swift

import Foundation
import UIKit
import SnapKit

class LoseQuizView: UIView {
    
    
    private (set) var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bgClassic
        return imageView
    }()

    private (set) var titleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Don't worry!", font: .customFont(font: .peralta, style: .regular, size: 28), textColor: .white, paragraphSpacing: 0, lineHeightMultiple: 1.03)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var subTitleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "This time you didn't pass the quiz! Keep studying the myths and legends, and you will surely succeed.\n\nTry again, good luck!", font: .customFont(font: .inter, style: .medium, size: 18), textColor: .white, paragraphSpacing: 0, lineHeightMultiple: 1.24)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var imgLosed: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgLosed
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private (set) var btnOk: UIButton = {
        let button = UIButton()
        button.configureButton(withTitle: "Thanks", font: .customFont(font: .peralta, style: .regular, size: 32), titleColor: .white, normalImage: .btnNormal, highlightedImage: .btnSelect)
        return button
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

        [bgImage, titleLabel, subTitleLabel, imgLosed, btnOk] .forEach(addSubview(_:))
    }
    
    private func setupConstraints() {
     
        bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(48)
            make.left.right.equalToSuperview().inset(20)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16.autoSize)
            make.left.right.equalToSuperview().inset(20)
        }
        
        imgLosed.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(32.autoSize)
            make.left.right.equalToSuperview().inset(20)
            make.size.equalTo(313)
        }
        
        btnOk.snp.makeConstraints { make in
            make.top.equalTo(imgLosed.snp.bottom).offset(32.autoSize)
            make.centerX.equalToSuperview()
            make.width.equalTo(353)
            make.height.equalTo(80)
        }
    }
}


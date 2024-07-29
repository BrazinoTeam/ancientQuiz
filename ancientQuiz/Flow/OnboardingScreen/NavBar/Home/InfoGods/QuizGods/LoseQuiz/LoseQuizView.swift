//
//  LoseQuizView.swift

import Foundation
import UIKit
import SnapKit

class LoseQuizView: UIView {
    
    
    private (set) var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bgHome
        return imageView
    }()

    private (set) var titleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Don't worry!", font: .customFont(font: .peralta, style: .regular, size: 28), textColor: .white, paragraphSpacing: 0, lineHeightMultiple: 1.03)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var subTitleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "This time you didn't pass the quiz! Keep studying the myths and legends, and you will surely succeed.\nTry again, good luck!", font: .systemFont(ofSize: 18, weight: .medium), textColor: .white, paragraphSpacing: 0, lineHeightMultiple: 1.08)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var imgLosed: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgLosed
        return imageView
    }()
    
    private (set) var btnOk: UIButton = {
        let button = UIButton()
        button.configureButton(withTitle: "Thanks", font: .customFont(font: .peralta, style: .regular, size: 32), titleColor: .white, normalImage: .btnNormal, highlightedImage: .btnSelect)
        button.layer.cornerRadius = 35
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.shadowColor = UIColor(red: 0.976, green: 0.471, blue: 0.216, alpha: 0.5).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 20
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
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
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(80)
            make.left.right.equalToSuperview().inset(20)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16.autoSize)
            make.left.right.equalToSuperview().inset(20)
        }
        
        imgLosed.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(32.autoSize)
            make.left.right.equalToSuperview().inset(20)
            make.width.equalTo(353.autoSize)
            make.height.equalTo(280.autoSize)
        }
        
        btnOk.snp.makeConstraints { make in
            make.top.equalTo(imgLosed.snp.bottom).offset(32.autoSize)
            make.centerX.equalToSuperview()
            make.width.equalTo(353)
            make.height.equalTo(75)
        }
    }
}


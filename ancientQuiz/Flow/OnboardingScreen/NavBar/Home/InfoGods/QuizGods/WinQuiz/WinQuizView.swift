//
//  WinQuizView.swift

import Foundation
import UIKit
import SnapKit

class WinQuizView: UIView {
    
    private (set) var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bgClassic
        return imageView
    }()

    private (set) var titleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Congratulations!", font: .customFont(font: .peralta, style: .regular, size: 28), textColor: .white, paragraphSpacing: 0, lineHeightMultiple: 1.03)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var subTitleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "You successfully completed the quiz about ancient Egyptian gods!\n\nYour reward is", font: .systemFont(ofSize: 18, weight: .medium), textColor: .white, paragraphSpacing: 0, lineHeightMultiple: 1.24)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var imgPointsWin: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgPointsWin
        return imageView
    }()
    
    private (set) var imgWinner: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgWin
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

        [bgImage, titleLabel, subTitleLabel, imgPointsWin, imgWinner, btnOk] .forEach(addSubview(_:))
    }
    
    private func setupConstraints() {
     
        bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(24.autoSize)
            make.left.right.equalToSuperview().inset(20)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16.autoSize)
            make.left.right.equalToSuperview().inset(20)
        }
        
        imgPointsWin.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(-8.autoSize)
            make.centerX.equalToSuperview()
            make.width.equalTo(249.autoSize)
            make.height.equalTo(136.autoSize)
        }
        
        imgWinner.snp.makeConstraints { make in
            make.top.equalTo(imgPointsWin.snp.bottom).offset(-8.autoSize)
            make.left.right.equalToSuperview().inset(20)
            make.size.equalTo(367.autoSize)
        }
        
        btnOk.snp.makeConstraints { make in
            make.top.equalTo(imgWinner.snp.bottom).offset(16.autoSize)
            make.centerX.equalToSuperview()
            make.width.equalTo(353.autoSize)
            make.height.equalTo(80.autoSize)
        }
    }
}


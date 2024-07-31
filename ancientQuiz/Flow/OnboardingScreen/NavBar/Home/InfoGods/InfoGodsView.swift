//
//  InfoGodsView.swift
import Foundation
import UIKit
import SnapKit

class InfoGodsView: UIView {
    
    private (set) var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bgClassic
        return imageView
    }()
 
    private (set) var backBtn: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(.btnBack, for: .normal)
        btn.setBackgroundImage(.btnBackSelect, for: .highlighted)
        return btn
    }()
    
    private (set) var titleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Info", font: .customFont(font: .peralta, style: .regular, size: 28), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.textAlignment = .center
        return label
    }()
    
    private (set) var centerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private(set) lazy var bodyFieldInfo: UITextView = {
        let textView = UITextView()
        let textStyle = NSMutableParagraphStyle()
        textStyle.lineBreakMode = .byWordWrapping
        textStyle.lineHeightMultiple = 1.24

        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.customFont(font: .inter, style: .medium, size: 18),
            .foregroundColor: UIColor.white,
            .paragraphStyle: textStyle
        ]
        
        let attributedText = NSAttributedString(string: "      The", attributes: attributes)
        textView.attributedText = attributedText
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.showsVerticalScrollIndicator = false
        textView.textColor = .white
        textView.textContainerInset = UIEdgeInsets(top: 0, left: 20, bottom: 72, right: 20)
        textView.isScrollEnabled = true
        return textView
    }()
    
    private (set) var gradientTextView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = false
        return view
    }()
    
    let quizBtn: UIButton = {
        let button = UIButton()
        button.configureButton(withTitle: "Quiz", font: .customFont(font: .peralta, style: .regular, size: 32), titleColor: .white, normalImage: .btnNormal, highlightedImage: .btnSelect)
        return button
    }()
    
    private var gradientLayer: CAGradientLayer?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
        setupGradientLayer()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateGradientFrame()
    }
    
    private func setupUI() {
        [bgImage, backBtn, titleLabel, centerImage, bodyFieldInfo, gradientTextView, quizBtn] .forEach(addSubview(_:))
    }
    
    private func setupConstraints() {
        bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(24)
        }
   
        backBtn.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.left.equalToSuperview().offset(20)
        }
        
        centerImage.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(338)
        }
        
        bodyFieldInfo.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(centerImage.snp.bottom).offset(32)
            make.bottom.equalToSuperview()
        }
        
        gradientTextView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(centerImage.snp.bottom).offset(32)
            make.bottom.equalToSuperview()
        }
        
        quizBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func updateGradientFrame() {
        gradientLayer?.frame = bodyFieldInfo.bounds
    }
    
    private func setupGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer?.colors = [
            UIColor.clear.cgColor,
            UIColor.clear.withAlphaComponent(0.2).cgColor,
            UIColor.clear.withAlphaComponent(0.5).cgColor,
            UIColor.black.cgColor,
        ]
        gradientLayer?.locations = [0.0, 0.3, 0.6, 1.0]
        gradientLayer?.frame = gradientTextView.bounds
        gradientTextView.layer.insertSublayer(gradientLayer!, at: 0)
    }
}

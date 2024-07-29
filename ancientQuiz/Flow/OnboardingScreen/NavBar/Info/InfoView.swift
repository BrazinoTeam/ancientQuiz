//
//  InfoView.swift

import Foundation
import UIKit
import SnapKit

class InfoView: UIView {
    
    private (set) var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bgHome
        return imageView
    }()
    
    
    private (set) var titleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "About Us", font: .customFont(font: .peralta, style: .regular, size: 28), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1)
        return label
    }()
    
    private (set) var imageInfo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgGodsOne
        return imageView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private (set) var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to\nAncient Quiz!"
        label.font = .customFont(font: .peralta, style: .regular, size: 28)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var bodyLabel: UILabel = {
        let label = UILabel.createLabel(withText: """
Explore the mysteries of ancient Egypt and test your knowledge in exciting quizzes. Your goal is to answer questions about the 10 famous Egyptian gods, such as Ra, Osiris, Isis, Horus, Anubis, and others.

How to Play:

    \u{2022}Choose a God: On the main page, you will find a list of gods. Click on a god's image to learn more about them.

    \u{2022}Study the Information: On the description page, you will find fascinating stories and myths about each god.

    \u{2022}Take the Quiz: Click on the "Quiz" button to start the quiz. You will need to answer 10 questions.

    \u{2022}Earn Rewards: For each correct answer, you earn points. If you answer 7 or more questions correctly, you will receive 100 coins!

    \u{2022}Daily Bonuses: Don't forget to visit the game every day to receive additional rewards.

Helpful Tips:

     \u{2022}Read Descriptions Carefully: All the information you need for the correct answers is contained in the descriptions of the gods.

     \u{2022}Take Your Time: Carefully consider each question to increase your chances of answering correctly.

     \u{2022}Collect Coins: Accumulated coins will help you unlock new levels and receive additional bonuses.

Immerse yourself in ancient myths and legends with Ancient Quiz and become a true expert in Egyptian mythology!
""", font: .customFont(font: .peralta, style: .regular, size: 14), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1.13)
        label.textAlignment = .justified
        label.numberOfLines = 0
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
   
        [bgImage, titleLabel, scrollView] .forEach(addSubview(_:))
        scrollView.addSubview(contentView)
        contentView.addSubview(imageInfo)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(bodyLabel)

    }
    
    private func setupConstraints() {
     
        bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(24)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-104)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
        
        imageInfo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.centerX.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageInfo.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }
        
        bodyLabel.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(20.autoSize)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
    }
}


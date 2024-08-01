//
//  InfoView.swift

import Foundation
import UIKit
import SnapKit

class InfoView: UIView {
    
    private (set) var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bgInfo
        return imageView
    }()
    
    
    private (set) var titleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "About Us", font: .customFont(font: .peralta, style: .regular, size: 28), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1)
        return label
    }()
    
    private (set) var imageInfo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgInfo
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
        label.text = "Welcome to Ancient\nQuiz!"
        label.font = .customFont(font: .peralta, style: .regular, size: 28)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var labelOne: UILabel = {
        let label = UILabel.createLabel(withText: "Explore the mysteries of ancient Egypt and test your knowledge in exciting quizzes. Your goal is to answer questions about the 10 famous Egyptian gods, such as Ra, Osiris, Isis, Horus, Anubis, and others.", font: .customFont(font: .inter, style: .semiBold, size: 14), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var labelTwo: UILabel = {
        let label = UILabel()
        label.text = "How to Play:"
        label.font = .customFont(font: .peralta, style: .regular, size: 16)
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private(set) var labelThree: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left

        let fullText = """
        1. Choose a God: On the main page, you will find a list of gods. Click on a god's image to learn more about them.
        2. Study the Information: On the description page, you will find fascinating stories and myths about each god.
        3. Take the Quiz: Click on the "Quiz" button to start the quiz. You will need to answer 10 questions.
        4. Earn Rewards: For each correct answer, you earn points. If you answer 7 or more questions correctly, you will receive 100 coins!
        5. Daily Bonuses: Don't forget to visit the game every day to receive additional rewards.
        """

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1
        paragraphStyle.paragraphSpacing = 1
        paragraphStyle.headIndent = 18
        paragraphStyle.firstLineHeadIndent = 0

        let attributedString = NSMutableAttributedString(string: fullText, attributes: [
            .font: UIFont.customFont(font: .inter, style: .semiBold, size: 14),
            .foregroundColor: UIColor.white,
            .paragraphStyle: paragraphStyle
        ])

        label.attributedText = attributedString
        return label
    }()
    
    private (set) var labelFour: UILabel = {
        let label = UILabel.createLabel(withText: "Helpful Tips:", font: .customFont(font: .peralta, style: .regular, size: 16), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var labelFive: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left

        let fullText = """
        1. Read Descriptions Carefully: All the information you need for the correct answers is contained in the descriptions of the gods.
        2. Take Your Time: Carefully consider each question to increase your chances of answering correctly.
        3. Collect Coins: Accumulated coins will help you unlock new levels and receive additional bonuses.
        """

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1
        paragraphStyle.paragraphSpacing = 1
        paragraphStyle.headIndent = 18
        paragraphStyle.firstLineHeadIndent = 0

        let attributedString = NSMutableAttributedString(string: fullText, attributes: [
            .font: UIFont.customFont(font: .inter, style: .semiBold, size: 14),
            .foregroundColor: UIColor.white,
            .paragraphStyle: paragraphStyle
        ])

        label.attributedText = attributedString
        return label
    }()
    
    private (set) var labelSix: UILabel = {
        let label = UILabel.createLabel(withText: "Immerse yourself in ancient myths and legends with Ancient Quiz and become a true expert in Egyptian mythology!", font: .customFont(font: .peralta, style: .regular, size: 16), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.textAlignment = .left
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
        contentView.addSubview(labelOne)
        contentView.addSubview(labelTwo)
        contentView.addSubview(labelThree)
        contentView.addSubview(labelFour)
        contentView.addSubview(labelFive)
        contentView.addSubview(labelSix)

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
        
        labelOne.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(20.autoSize)
            make.left.right.equalToSuperview().inset(20)
        }
        
        labelTwo.snp.makeConstraints { make in
            make.top.equalTo(labelOne.snp.bottom).offset(16.autoSize)
            make.left.right.equalToSuperview().inset(20)
        }
        
        labelThree.snp.makeConstraints { make in
            make.top.equalTo(labelTwo.snp.bottom).offset(16.autoSize)
            make.left.right.equalToSuperview().inset(20)
        }
        
        labelFour.snp.makeConstraints { make in
            make.top.equalTo(labelThree.snp.bottom).offset(16.autoSize)
            make.left.right.equalToSuperview().inset(20)
        }
        
        labelFive.snp.makeConstraints { make in
            make.top.equalTo(labelFour.snp.bottom).offset(16.autoSize)
            make.left.right.equalToSuperview().inset(20)
        }
        
        labelSix.snp.makeConstraints { make in
            make.top.equalTo(labelFive.snp.bottom).offset(16.autoSize)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
    }
}


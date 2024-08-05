//
//  QuizGodsView.swift


import Foundation
//
//  InfoQuizView.swift
import Foundation
import UIKit
import SnapKit

class InfoQuizView: UIView {
    
    private var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bgClassic
        return imageView
    }()
    
    private (set) var backBtn: UIButton = {
        let button = UIButton()
        button.setImage(.btnBack, for: .normal)
        button.setBackgroundImage(.btnBackSelect, for: .highlighted)
        return button
    }()
    
    private (set) var titleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Quiz", font: .customFont(font: .peralta, style: .regular, size: 20), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1.09)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private var bgQuiz: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgBgQuiz
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private (set) var quizLabel: UILabel = {
        let label = UILabel.createLabel(withText: "What", font: .customFont(font: .peralta, style: .regular, size: 20), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1.09)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private var circleViews: [UIImageView] = []
    private var isInitialGradientApplied = false

    private let circleContainerView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 6
        return stackView
    }()
    
    private (set) var imgChoose: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgChooseLabel
        return imageView
    }()
   
    private (set) var chooseLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Choose the correct answer", font: .customFont(font: .peralta, style: .regular, size: 12), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1.09)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
   
    
    private(set) var collectionView: UICollectionView = {
          let layout = UICollectionViewFlowLayout()
          layout.scrollDirection = .vertical
          let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
          collectionView.backgroundColor = .clear
          collectionView.register(QuizOptionCell.self, forCellWithReuseIdentifier: "QuizOptionCell")
          return collectionView
      }()
    
    private (set) var quizBtn: UIButton = {
        let btn = UIButton()
        btn.configureButton(withTitle: "Answer", font: .customFont(font: .peralta, style: .regular, size: 32), titleColor: .white, normalImage: .btnNormal, highlightedImage: .btnSelect)
   
        return btn
    }()
    
    private var backgroundGradientLayer: CAGradientLayer?

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        (1...10).forEach { _ in
            let circleView = UIImageView()
            circleView.image = .imgScarabGrey
            circleView.contentMode = .scaleToFill
            circleView.snp.makeConstraints { make in
                make.width.height.equalTo(30.autoSize)
            }
            circleViews.append(circleView)
            circleContainerView.addArrangedSubview(circleView)
        }
        
        [backgroundImage, backBtn, titleLabel, circleContainerView, bgQuiz, quizLabel, imgChoose, collectionView, quizBtn] .forEach(addSubview(_:))
        imgChoose.addSubview(chooseLabel)
    }
    
    private func setupConstraints() {
     
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(24.autoSize)
        }
   
        backBtn.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.left.equalToSuperview().offset(20)
        }
        
        bgQuiz.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(80.autoSize)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(150)
        }
        
        quizLabel.snp.makeConstraints { make in
            make.top.equalTo(bgQuiz.snp.top).offset(24.autoSize)
            make.left.right.equalTo(bgQuiz).inset(16.autoSize)
            make.bottom.equalTo(bgQuiz.snp.bottom).offset(-20.autoSize)
        }
        
        circleContainerView.snp.makeConstraints { make in
            make.top.equalTo(bgQuiz.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(20)
        }
        
        imgChoose.snp.makeConstraints { make in
            make.centerY.equalTo(bgQuiz.snp.top)
            make.centerX.equalTo(bgQuiz)
            make.height.equalTo(32)
        }
        
        chooseLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(circleContainerView.snp.bottom).offset(20.autoSize)
            make.left.right.equalToSuperview()
            make.height.equalTo(292.autoSize)
        }
        
        quizBtn.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(24.autoSize)
            make.centerX.equalToSuperview()
            make.width.equalTo(353.autoSize)
            make.height.equalTo(80.autoSize)
        }
    }
    
    func updateCircleColor(at index: Int, isCorrect: Bool, isCurrent: Bool) {
        guard index < circleViews.count else { return }
        
        if isCurrent {
            circleViews[index].image = .imgScarabYellow
        } else {
            circleViews[index].image = isCorrect ? .imgScarabGreen : .imgScarabRed
        }
    }
}

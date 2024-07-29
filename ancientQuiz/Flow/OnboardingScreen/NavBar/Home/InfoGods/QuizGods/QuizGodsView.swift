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
        imageView.image = .bgHome
        return imageView
    }()
    
    private (set) var backBtn: UIButton = {
        let button = UIButton()
        button.setImage(.btnBack, for: .normal)
        return button
    }()
    
    private (set) var titleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Quiz", font: .customFont(font: .peralta, style: .regular, size: 20), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1.09)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var quizLabel: UILabel = {
        let label = UILabel.createLabel(withText: "What", font: .customFont(font: .peralta, style: .regular, size: 20), textColor: .black, paragraphSpacing: 1, lineHeightMultiple: 1.09)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private var circleViews: [UIView] = []
    private var isInitialGradientApplied = false

    private let circleContainerView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 12
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
        btn.layer.cornerRadius = 35
        btn.layer.borderWidth = 5
        btn.layer.borderColor = UIColor.red.cgColor
        btn.layer.shadowColor = UIColor(red: 0.976, green: 0.471, blue: 0.216, alpha: 0.5).cgColor
        btn.layer.shadowOpacity = 1
        btn.layer.shadowRadius = 20
        btn.layer.shadowOffset = CGSize(width: 0, height: 2)
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
            let circleView = UIView()
            circleView.backgroundColor = .gray
            circleView.layer.cornerRadius = 8.autoSize
            circleView.snp.makeConstraints { make in
                make.width.height.equalTo(16.autoSize)
            }
            circleViews.append(circleView)
            circleContainerView.addArrangedSubview(circleView)
        }
        
        [backgroundImage, backBtn, titleLabel, circleContainerView, quizLabel, imgChoose, collectionView, quizBtn] .forEach(addSubview(_:))
        imgChoose.addSubview(chooseLabel)
    }
    
    private func setupConstraints() {
     
        backgroundImage.snp.makeConstraints { make in
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
        
        quizLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(32.autoSize)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(150.autoSize)
        }
        
        circleContainerView.snp.makeConstraints { make in
            make.top.equalTo(quizLabel.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }
        
        imgChoose.snp.makeConstraints { make in
            make.top.equalTo(circleContainerView.snp.bottom).offset(24.autoSize)
            make.centerX.equalToSuperview()
            make.height.equalTo(32)
        }
        
        chooseLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(imgChoose.snp.bottom).offset(20.autoSize)
            make.left.right.equalToSuperview()
            make.height.equalTo(292)
        }
        
        quizBtn.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.width.equalTo(376.autoSize)
            make.height.equalTo(80.autoSize)
        }
    }
    
    func updateCircleColor(at index: Int, isCorrect: Bool, isCurrent: Bool) {
        guard index < circleViews.count else { return }
        
        if isCurrent {
            circleViews[index].backgroundColor = .clear
            circleViews[index].layer.borderWidth = 1
            circleViews[index].layer.borderColor = UIColor.red.cgColor
        } else {
            circleViews[index].backgroundColor = isCorrect ? .green : .red
            circleViews[index].layer.borderWidth = 0
        }
    }
}

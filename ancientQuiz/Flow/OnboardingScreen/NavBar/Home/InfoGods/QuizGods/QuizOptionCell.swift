//
//  QuizOptionCell.swift


import UIKit
import SnapKit

class QuizOptionCell: UICollectionViewCell {
    
    private(set) var quizView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.clear.cgColor
        view.layer.cornerRadius = 6
        return view
    }()
    
    private(set) var bgCell: UIImageView = {
        let img = UIImageView()
        img.image = .imgBgCell
        img.contentMode = .scaleToFill
        return img
    }()
    
    private(set) var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(font: .peralta, style: .regular, size: 12)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private(set) var optionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.customFont(font: .peralta, style: .regular, size: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private var gradientLayer: CAGradientLayer?
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
        contentView.addSubview(quizView)
        contentView.addSubview(bgCell)
        contentView.addSubview(optionLabel)
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 6
    }
    
    private func setupConstraints() {
        quizView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        bgCell.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        optionLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(320)
            make.height.equalTo(42)
        }
    }
    
    
    func configure(with variant: GodsModel.Gods.Quiz.Question.Variant, at index: Int) {
        optionLabel.text = variant.text
        optionLabel.textColor = .white
        nameLabel.textColor = .white
        contentView.backgroundColor = .clear
        removeBackgroundGradient()
        removeGradientBorder()
        
    }
    
    func setSelected(_ selected: Bool) {
        if selected {
            bgCell.image = .imgBgCellSelect
        } else {
            bgCell.image = .imgBgCell
        }
    }
    
    func setCorrect(_ correct: Bool) {
        if correct {
            bgCell.image = .imgBgCellGreen
        } else {
            bgCell.image = .imgBgCellRed
            optionLabel.textColor = .white

        }
    }
    
    private func applyGradientBackground() {
        gradientLayer?.removeFromSuperlayer()

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.cTabOne.cgColor, UIColor.cTabTwo.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.frame = contentView.bounds
        gradientLayer.cornerRadius = contentView.layer.cornerRadius

        contentView.layer.insertSublayer(gradientLayer, at: 0)
        self.gradientLayer = gradientLayer
        optionLabel.textColor = .white
    }
    
    private func removeGradientBorder() {
        gradientLayer?.removeFromSuperlayer()
        gradientLayer = nil
        optionLabel.textColor = .white
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.borderWidth = 2
    }
    
    private func applyBackgroundGradient() {
        removeBackgroundGradient()
        
        let backgroundGradientLayer = CAGradientLayer()
        backgroundGradientLayer.colors = [UIColor.green.cgColor, UIColor.yellow.cgColor]
        backgroundGradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        backgroundGradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        backgroundGradientLayer.frame = contentView.bounds
        backgroundGradientLayer.cornerRadius = contentView.layer.cornerRadius
        
        contentView.layer.insertSublayer(backgroundGradientLayer, at: 0)
        self.backgroundGradientLayer = backgroundGradientLayer
    }
    
    private func removeBackgroundGradient() {
        backgroundGradientLayer?.removeFromSuperlayer()
        backgroundGradientLayer = nil
        contentView.backgroundColor = .clear
    }
}

import Foundation
import UIKit
import SnapKit

class ProfileView: UIView, UITextFieldDelegate {
    
    private (set) var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bgClassic
        return imageView
    }()
    
    private (set) var titleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Profile", font: .customFont(font: .peralta, style: .regular, size: 28), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.textAlignment = .center
        return label
    }()
    
    private (set) var containerProfile: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        return view
    }()
    
    private(set) var btnUserPhoto: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(.imgUserProfile, for: .normal)
        btn.layer.cornerRadius = 24
        btn.clipsToBounds = true
        return btn
    }()
    
    private(set) lazy var profileTextField: UITextField = {
        let textField = UITextField()
        let font = UIFont.customFont(font: .peralta, style: .regular, size: 20)
        let fontSize = CGFloat(20)
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.white.withAlphaComponent(0.5),
            .kern: fontSize * 0.04
        ]
        
        let placeholderText = NSAttributedString(string: "User #\(UD.shared.userID ?? 1)", attributes: placeholderAttributes)
        textField.attributedPlaceholder = placeholderText

        if let savedUserName = UD.shared.userID {
            textField.placeholder = "user#\(savedUserName)"
        }
        
        let textAttributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.white,
            .kern: fontSize * 0.04
        ]
        textField.font = .customFont(font: .peralta, style: .regular, size: 20)
        textField.textColor = .white
        textField.backgroundColor = .clear
        textField.textAlignment = .left
        textField.delegate = self
        textField.returnKeyType = .done
        return textField
    }()
    
    private (set) var btnEdit: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(.btnEdit, for: .normal)
        return btn
    }()
    
    private (set) var containerAnaliz: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private (set) var labelTotalCoints: UILabel = {
        let label = UILabel.createLabel(withText: "Total Coins\nCollected", font: UIFont.systemFont(ofSize: 14, weight: .semibold), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var countLabelTotal: UILabel = {
        let label = UILabel.createLabel(withText: "1000", font: .customFont(font: .peralta, style: .regular, size: 20), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var labelQuizzes: UILabel = {
        let label = UILabel.createLabel(withText: "Quizzes\nCompleted", font: UIFont.systemFont(ofSize: 14, weight: .semibold), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var countLabelQuizzes: UILabel = {
        let label = UILabel.createLabel(withText: "2000", font: .customFont(font: .peralta, style: .regular, size: 20), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var labelUnlocked: UILabel = {
        let label = UILabel.createLabel(withText: "Achievements\nUnlocked", font: UIFont.systemFont(ofSize: 14, weight: .semibold), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var countLabelUnlocked: UILabel = {
        let label = UILabel.createLabel(withText: "3000", font: .customFont(font: .peralta, style: .regular, size: 20), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var leftView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private (set) var rightView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private var containerProfileGradientLayer: CAGradientLayer?
    private var leftViewGradientLayer: CAGradientLayer?
    private var rightViewGradientLayer: CAGradientLayer?

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private (set) var achivLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Achievements", font: .customFont(font: .peralta, style: .regular, size: 28), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.textAlignment = .center
        return label
    }()
    
    private (set) var achivOne: AchivView = {
        let view = AchivView(frame: .zero, image: .imgGodsOne, titleText: "Sun God Expert")
        return view
    }()
    
    private (set) var achivTwo: AchivView = {
        let view = AchivView(frame: .zero, image: .imgGodsTwo, titleText: "Underworld Master")
        return view
    }()
    
    private (set) var achivThree: AchivView = {
        let view = AchivView(frame: .zero, image: .imgGodsThree, titleText: "Magic Enthusiast")
        return view
    }()
    
    private (set) var achivFour: AchivView = {
        let view = AchivView(frame: .zero, image: .imgGodsFour, titleText: "Sky Guardian")
        return view
    }()
    
    private (set) var achivFive: AchivView = {
        let view = AchivView(frame: .zero, image: .imgGodsFive, titleText: "Embalmer")
        return view
    }()
    
    private (set) var achivSix: AchivView = {
        let view = AchivView(frame: .zero, image: .imgGodsSix, titleText: "Chaos Conqueror")
        return view
    }()
    
    private (set) var achivSeven: AchivView = {
        let view = AchivView(frame: .zero, image: .imgGodsSeven, titleText: "Wisdom Seeker")
        return view
    }()
    
    private (set) var achivEight: AchivView = {
        let view = AchivView(frame: .zero, image: .imgGodsEight, titleText: "Truth Keeper")
        return view
    }()
    
    private (set) var achivNine: AchivView = {
        let view = AchivView(frame: .zero, image: .imgGodsNine, titleText: "Joy Bringer")
        return view
    }()
    
    private (set) var achivTen: AchivView = {
        let view = AchivView(frame: .zero, image: .imgGodsTen, titleText: "Home Protector")
        return view
    }()
    
    private (set) var achivEleven: AchivView = {
        let view = AchivView(frame: .zero, image: .imgGodsOne, titleText: "Coin Collector")
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
        saveName()
        addGradientLayer(to: containerProfile)
        addGradientLayer(to: leftView)
        addGradientLayer(to: rightView)

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [bgImage, titleLabel, containerProfile, containerAnaliz, scrollView] .forEach(addSubview(_:))
        containerProfile.addSubview(btnUserPhoto)
        containerProfile.addSubview(profileTextField)
        containerProfile.addSubview(btnEdit)
        containerAnaliz.addSubview(labelTotalCoints)
        containerAnaliz.addSubview(labelQuizzes)
        containerAnaliz.addSubview(labelUnlocked)
        containerAnaliz.addSubview(countLabelTotal)
        containerAnaliz.addSubview(countLabelQuizzes)
        containerAnaliz.addSubview(countLabelUnlocked)
        containerAnaliz.addSubview(leftView)
        containerAnaliz.addSubview(rightView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(achivLabel)
        contentView.addSubview(achivOne)
        contentView.addSubview(achivTwo)
        contentView.addSubview(achivThree)
        contentView.addSubview(achivFour)
        contentView.addSubview(achivFive)
        contentView.addSubview(achivSix)
        contentView.addSubview(achivSeven)
        contentView.addSubview(achivEight)
        contentView.addSubview(achivNine)
        contentView.addSubview(achivTen)
        contentView.addSubview(achivEleven)
    }
    
    private func setupConstraints() {
        bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(24)
        }
        
        containerProfile.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.width.equalTo(353)
            make.height.equalTo(80)
        }
        
        btnUserPhoto.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.size.equalTo(48)
        }
        
        profileTextField.snp.makeConstraints { make in
            make.centerY.equalTo(btnUserPhoto)
            make.left.equalTo(btnUserPhoto.snp.right).offset(16)
            make.width.equalTo(216)
            make.height.equalTo(20)
        }
        
        btnEdit.snp.makeConstraints { make in
            make.centerY.equalTo(btnUserPhoto)
            make.right.equalToSuperview().offset(-16)
        }
        
        containerAnaliz.snp.makeConstraints { make in
            make.top.equalTo(containerProfile.snp.bottom).offset(32)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(66)
        }
        
        labelQuizzes.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        countLabelQuizzes.snp.makeConstraints { make in
            make.centerX.equalTo(labelQuizzes)
            make.bottom.equalTo(labelQuizzes.snp.top).offset(-8)
        }
        
        labelTotalCoints.snp.makeConstraints { make in
            make.right.equalTo(labelQuizzes.snp.left).offset(-34)
            make.bottom.equalToSuperview()
        }
        
        countLabelTotal.snp.makeConstraints { make in
            make.centerX.equalTo(labelTotalCoints)
            make.bottom.equalTo(labelTotalCoints.snp.top).offset(-8)
        }
        
        labelUnlocked.snp.makeConstraints { make in
            make.left.equalTo(labelQuizzes.snp.right).offset(34)
            make.bottom.equalToSuperview()
        }
        
        countLabelUnlocked.snp.makeConstraints { make in
            make.centerX.equalTo(labelUnlocked)
            make.bottom.equalTo(labelUnlocked.snp.top).offset(-8)
        }
        
        leftView.snp.makeConstraints { make in
            make.right.equalTo(labelQuizzes.snp.left).offset(-16)
            make.height.equalTo(54)
            make.centerY.equalToSuperview()
            make.width.equalTo(1)
        }
        
        rightView.snp.makeConstraints { make in
            make.left.equalTo(labelQuizzes.snp.right).offset(16)
            make.height.equalTo(54)
            make.centerY.equalToSuperview()
            make.width.equalTo(1)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(containerAnaliz.snp.bottom).offset(32)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-104)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
        
        achivLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        achivOne.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(achivLabel.snp.bottom).offset(24)
            make.height.equalTo(140)
            make.width.equalTo(110)
        }
        
        achivTwo.snp.makeConstraints { make in
            make.left.equalTo(achivOne.snp.right).offset(8)
            make.top.equalTo(achivLabel.snp.bottom).offset(24)
            make.height.equalTo(140)
            make.width.equalTo(110)
        }
        
        achivThree.snp.makeConstraints { make in
            make.left.equalTo(achivTwo.snp.right).offset(8)
            make.top.equalTo(achivLabel.snp.bottom).offset(24)
            make.height.equalTo(140)
            make.width.equalTo(110)
        }
        
        achivFour.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(achivOne.snp.bottom).offset(8)
            make.height.equalTo(140)
            make.width.equalTo(110)
        }
        
        achivFive.snp.makeConstraints { make in
            make.left.equalTo(achivFour.snp.right).offset(8)
            make.top.equalTo(achivOne.snp.bottom).offset(8)
            make.height.equalTo(140)
            make.width.equalTo(110)
        }
        
        achivSix.snp.makeConstraints { make in
            make.left.equalTo(achivFive.snp.right).offset(8)
            make.top.equalTo(achivOne.snp.bottom).offset(8)
            make.height.equalTo(140)
            make.width.equalTo(110)
        }
        
        achivSeven.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(achivFour.snp.bottom).offset(8)
            make.height.equalTo(140)
            make.width.equalTo(110)
        }
        
        achivEight.snp.makeConstraints { make in
            make.left.equalTo(achivSeven.snp.right).offset(8)
            make.top.equalTo(achivFour.snp.bottom).offset(8)
            make.height.equalTo(140)
            make.width.equalTo(110)
        }
        
        achivNine.snp.makeConstraints { make in
            make.left.equalTo(achivEight.snp.right).offset(8)
            make.top.equalTo(achivFour.snp.bottom).offset(8)
            make.height.equalTo(140)
            make.width.equalTo(110)
        }
        
        achivTen.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(achivSeven.snp.bottom).offset(8)
            make.height.equalTo(140)
            make.width.equalTo(110)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        achivEleven.snp.makeConstraints { make in
            make.left.equalTo(achivTen.snp.right).offset(8)
            make.top.equalTo(achivSeven.snp.bottom).offset(8)
            make.height.equalTo(140)
            make.width.equalTo(110)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    private func addGradientLayer(to view: UIView) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.yellow.cgColor, UIColor.orange.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
        if view == containerProfile {
               self.containerProfileGradientLayer = gradientLayer
           } else if view == leftView {
               self.leftViewGradientLayer = gradientLayer
           } else if view == rightView {
               self.rightViewGradientLayer = gradientLayer
           }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerProfileGradientLayer?.frame = containerProfile.bounds
        leftViewGradientLayer?.frame = leftView.bounds
        rightViewGradientLayer?.frame = rightView.bounds
    }
    
    private func saveName() {
        if let savedUserName = UD.shared.userName {
            profileTextField.text = savedUserName
        }
    }

    
    internal func textFieldDidEndEditing(_ textField: UITextField) {
        UD.shared.userName = textField.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // Закрытие клавиатуры
        return true
    }
}

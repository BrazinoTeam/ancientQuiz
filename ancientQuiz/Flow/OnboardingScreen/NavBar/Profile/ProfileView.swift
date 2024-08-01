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
    
    private (set) var containerProfile: UIImageView = {
        let img = UIImageView()
        img.image = .imgContUserName
        img.contentMode = .scaleToFill
        return img
    }()
    
    private(set) var btnUserPhoto: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(.imgUserProfile, for: .normal)
        btn.layer.cornerRadius = 5
        btn.clipsToBounds = true
        return btn
    }()
    
    private (set) var labelUserName: UILabel = {
        let label = UILabel.createLabel(withText: "User Name", font: .customFont(font: .peralta, style: .regular, size: 20), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.textAlignment = .left
        return label
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
        let view = AchivView(frame: .zero, image: .imgAchiOne)
        return view
    }()
    
    private (set) var achivTwo: AchivView = {
        let view = AchivView(frame: .zero, image: .imgAchiTwo)
        return view
    }()
    
    private (set) var achivThree: AchivView = {
        let view = AchivView(frame: .zero, image: .imgAchiThree)
        return view
    }()
    
    private (set) var achivFour: AchivView = {
        let view = AchivView(frame: .zero, image: .imgAchiFour)
        return view
    }()
    
    private (set) var achivFive: AchivView = {
        let view = AchivView(frame: .zero, image: .imgAchiFive)
        return view
    }()
    
    private (set) var achivSix: AchivView = {
        let view = AchivView(frame: .zero, image: .imgAchiSix)
        return view
    }()
    
    private (set) var achivSeven: AchivView = {
        let view = AchivView(frame: .zero, image: .imgAchiSeven)
        return view
    }()
    
    private (set) var achivEight: AchivView = {
        let view = AchivView(frame: .zero, image: .imgAchiEight)
        return view
    }()
    
    private (set) var achivNine: AchivView = {
        let view = AchivView(frame: .zero, image: .imgAchiNine)
        return view
    }()
    
    private (set) var achivTen: AchivView = {
        let view = AchivView(frame: .zero, image: .imgAchiTen)
        return view
    }()
    
    private (set) var achivEleven: AchivView = {
        let view = AchivView(frame: .zero, image: .imgAchiEleven)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
        addGradientLayer(to: leftView)
        addGradientLayer(to: rightView)

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [bgImage, titleLabel, containerProfile, containerAnaliz, btnUserPhoto, btnEdit, scrollView] .forEach(addSubview(_:))
        containerProfile.addSubview(labelUserName)
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
            make.centerY.equalTo(containerProfile)
            make.left.equalTo(containerProfile.snp.left).offset(16)
            make.size.equalTo(52)
        }
        
        labelUserName.snp.makeConstraints { make in
            make.centerY.equalTo(btnUserPhoto)
            make.left.equalTo(btnUserPhoto.snp.right).offset(16)
            make.width.equalTo(216)
            make.height.equalTo(20)
        }
        
        btnEdit.snp.makeConstraints { make in
            make.centerY.equalTo(btnUserPhoto)
            make.right.equalTo(containerProfile.snp.right).offset(-16)
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
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-80)
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
            make.size.equalTo(109)
        }
        
        achivTwo.snp.makeConstraints { make in
            make.left.equalTo(achivOne.snp.right).offset(8)
            make.top.equalTo(achivLabel.snp.bottom).offset(24)
            make.size.equalTo(109)
        }
        
        achivThree.snp.makeConstraints { make in
            make.left.equalTo(achivTwo.snp.right).offset(8)
            make.top.equalTo(achivLabel.snp.bottom).offset(24)
            make.size.equalTo(109)
        }
        
        achivFour.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(achivOne.snp.bottom).offset(8)
            make.size.equalTo(109)
        }
        
        achivFive.snp.makeConstraints { make in
            make.left.equalTo(achivFour.snp.right).offset(8)
            make.top.equalTo(achivOne.snp.bottom).offset(8)
            make.size.equalTo(109)
        }
        
        achivSix.snp.makeConstraints { make in
            make.left.equalTo(achivFive.snp.right).offset(8)
            make.top.equalTo(achivOne.snp.bottom).offset(8)
            make.size.equalTo(109)
        }
        
        achivSeven.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(achivFour.snp.bottom).offset(8)
            make.size.equalTo(109)
        }
        
        achivEight.snp.makeConstraints { make in
            make.left.equalTo(achivSeven.snp.right).offset(8)
            make.top.equalTo(achivFour.snp.bottom).offset(8)
            make.size.equalTo(109)
        }
        
        achivNine.snp.makeConstraints { make in
            make.left.equalTo(achivEight.snp.right).offset(8)
            make.top.equalTo(achivFour.snp.bottom).offset(8)
            make.size.equalTo(109)
        }
        
        achivTen.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(achivSeven.snp.bottom).offset(8)
            make.size.equalTo(109)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        achivEleven.snp.makeConstraints { make in
            make.left.equalTo(achivTen.snp.right).offset(8)
            make.top.equalTo(achivSeven.snp.bottom).offset(8)
            make.size.equalTo(109)
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
        if view == rightView {
               self.rightViewGradientLayer = gradientLayer
           } else if view == leftView {
               self.leftViewGradientLayer = gradientLayer
           }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        leftViewGradientLayer?.frame = leftView.bounds
        rightViewGradientLayer?.frame = rightView.bounds
    }
}

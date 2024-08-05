//
//import UIKit
//
//final class NavBar: UITabBarController {
//    
//    private let home = HomeVC()
//    private let profile = ProfileVC()
//    private let bonus = BonusVC()
//    private let rating = LeaderboardVC()
//    private let info = InfoVC()
//    
//    private lazy var btn1 = getButton(icon: "btnHome", selectedIcon: "btnHomeTapped", tag: 0, action: action)
//    private lazy var btn2 = getButton(icon: "btnProfile", selectedIcon: "btnProfileTapped", tag: 1, action: action)
//    private lazy var btn3 = getButton(icon: "btnBonus", selectedIcon: "btnBonusTapped", tag: 2, action: action)
//    private lazy var btn4 = getButton(icon: "btnLead", selectedIcon: "btnLeadSelect", tag: 3, action: action)
//    private lazy var btn5 = getButton(icon: "btnInfo", selectedIcon: "btnInfoSelect", tag: 4, action: action)
//
//    lazy var action = UIAction { [weak self] sender in
//        guard
//            let sender = sender.sender as? UIButton,
//            let self = self
//        else { return }
//        
//        self.updateSelectedButton(sender.tag)
//        self.selectedIndex = sender.tag
//    }
//
//    private lazy var customBar: UIStackView = {
//        $0.axis = .horizontal
//        $0.distribution = .equalSpacing
//        $0.alignment = .center
//        $0.frame = CGRect(x: -5, y: view.frame.height - 127, width: view.frame.width + 10, height: 133)
//        $0.addArrangedSubview(btn1)
//        $0.addArrangedSubview(btn2)
//        $0.addArrangedSubview(btn3)
//        $0.addArrangedSubview(btn4)
//        $0.addArrangedSubview(btn5)
//        $0.layer.cornerRadius = 45
//        $0.layer.borderWidth = 5
//        $0.layer.borderColor = UIColor.cYellowBack.cgColor
//        $0.isLayoutMarginsRelativeArrangement = true
//        $0.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
//        $0.clipsToBounds = true
//        return $0
//    }(UIStackView())
//    
//    private let centerImageView: UIImageView = {
//           let imageView = UIImageView(image: UIImage(named: "yourImageName"))
//           imageView.contentMode = .scaleAspectFit
//           return imageView
//       }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        UITabBar.appearance().backgroundColor = .gray
//
//        view.addSubview(customBar)
//        tabBar.isHidden = true
//        setViewControllers([home, profile ,bonus, rating, info], animated: true)
//        selectedViewController = home
//        updateSelectedButton(0)
//        addGradientLayer(to: customBar)
//        setupConstraints()
//    }
//    
//    
//    private func addGradientLayer(to view: UIView) {
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [UIColor.cTabOne.cgColor, UIColor.cTabTwo.cgColor]
//        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
//        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
//        gradientLayer.frame = view.bounds
//        view.layer.insertSublayer(gradientLayer, at: 0)
//    }
//    
//    private func getButton(icon: String, selectedIcon: String, tag: Int, action: UIAction) -> UIButton {
//        return {
//            let image = UIImage(named: icon)?.withRenderingMode(.alwaysOriginal)
//            $0.setImage(image, for: .normal)
//            $0.tag = tag
//            $0.accessibilityIdentifier = icon
//            $0.accessibilityHint = selectedIcon
//            return $0
//        }(UIButton(primaryAction: action))
//    }
//    
//    private func updateSelectedButton(_ selectedIndex: Int) {
//        let buttons = [btn1, btn2, btn3, btn4, btn5]
//        
//        for (index, button) in buttons.enumerated() {
//            let icon = button.accessibilityIdentifier ?? ""
//            let selectedIcon = button.accessibilityHint ?? ""
//            
//            if icon.isEmpty || selectedIcon.isEmpty {
//                print("Icon or selectedIcon is empty for button at index \(index)")
//                continue
//            }
//            
//            if index == selectedIndex {
//                let selectedImage = UIImage(named: selectedIcon)?.withRenderingMode(.alwaysOriginal)
//                button.setImage(selectedImage, for: .normal)
//                
//            } else {
//                let image = UIImage(named: icon)?.withRenderingMode(.alwaysOriginal)
//                button.setImage(image, for: .normal)
//            }
//        }
//    }
//}
//
import UIKit
import SnapKit

final class NavBar: UITabBarController {
    
    private let home = HomeVC()
    private let profile = ProfileVC()
    private let bonus = BonusVC()
    private let rating = LeaderboardVC()
    private let info = InfoVC()
    
    private lazy var btn1 = getButton(icon: "btnHome", selectedIcon: "btnHomeTapped", tag: 0, action: action)
    private lazy var btn2 = getButton(icon: "btnProfile", selectedIcon: "btnProfileTapped", tag: 1, action: action)
    private lazy var btn3 = getButton(icon: "btnBonus", selectedIcon: "btnBonusTapped", tag: 2, action: action)
    private lazy var btn4 = getButton(icon: "btnLead", selectedIcon: "btnLeadSelect", tag: 3, action: action)
    private lazy var btn5 = getButton(icon: "btnInfo", selectedIcon: "btnInfoSelect", tag: 4, action: action)

    lazy var action = UIAction { [weak self] sender in
        guard
            let sender = sender.sender as? UIButton,
            let self = self
        else { return }
        
        self.updateSelectedButton(sender.tag)
        self.selectedIndex = sender.tag
    }

    private lazy var customBar: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.alignment = .center
        $0.frame = CGRect(x: -20, y: view.frame.height - 103, width: view.frame.width + 40, height: 113)
        $0.addArrangedSubview(btn1)
        $0.addArrangedSubview(btn2)
        $0.addArrangedSubview(btn3)
        $0.addArrangedSubview(btn4)
        $0.addArrangedSubview(btn5)
        $0.layer.cornerRadius = 45
        $0.layer.borderWidth = 5
        $0.layer.borderColor = UIColor.cYellowBack.cgColor
        $0.isLayoutMarginsRelativeArrangement = true
        $0.layoutMargins = UIEdgeInsets(top: 15, left: 40, bottom: 0, right: 40)
        $0.clipsToBounds = true
        return $0
    }(UIStackView())
    
    private let centerImageView: UIImageView = {
        let imageView = UIImageView(image: .imgNavBar)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().backgroundColor = .gray

        view.addSubview(customBar)
        view.addSubview(centerImageView)
        
        tabBar.isHidden = true
        setViewControllers([home, profile ,bonus, rating, info], animated: true)
        selectedViewController = home
        updateSelectedButton(0)
        addGradientLayer(to: customBar)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        customBar.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(-15)
            make.bottom.equalToSuperview().offset(20)
            make.height.equalTo(133)
        }
        
        centerImageView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(customBar.snp.top).offset(22)
            make.width.equalTo(91)
            make.height.equalTo(43)
        }
    }
    
    private func addGradientLayer(to view: UIView) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.cTabOne.cgColor, UIColor.cTabTwo.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func getButton(icon: String, selectedIcon: String, tag: Int, action: UIAction) -> UIButton {
        return {
            let image = UIImage(named: icon)?.withRenderingMode(.alwaysOriginal)
            $0.setImage(image, for: .normal)
            $0.tag = tag
            $0.accessibilityIdentifier = icon
            $0.accessibilityHint = selectedIcon
            return $0
        }(UIButton(primaryAction: action))
    }
    
    private func updateSelectedButton(_ selectedIndex: Int) {
        let buttons = [btn1, btn2, btn3, btn4, btn5]
        
        for (index, button) in buttons.enumerated() {
            let icon = button.accessibilityIdentifier ?? ""
            let selectedIcon = button.accessibilityHint ?? ""
            
            if icon.isEmpty || selectedIcon.isEmpty {
                print("Icon or selectedIcon is empty for button at index \(index)")
                continue
            }
            
            if index == selectedIndex {
                let selectedImage = UIImage(named: selectedIcon)?.withRenderingMode(.alwaysOriginal)
                button.setImage(selectedImage, for: .normal)
                
            } else {
                let image = UIImage(named: icon)?.withRenderingMode(.alwaysOriginal)
                button.setImage(image, for: .normal)
            }
        }
    }
}

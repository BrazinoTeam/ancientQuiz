
import UIKit

final class NavBar: UITabBarController {
    
    private let home = HomeVC()
    private let profile = ProfileVC()
    private let bonus = BonusVC()
    private let rating = LeaderboardVC()
    private let info = InfoVC()
    
    private lazy var btn1 = getButton(icon: "btnHome", selectedIcon: "btnHomeTapped", tag: 0, action: action)
    private lazy var btn2 = getButton(icon: "btnProfile", selectedIcon: "btnProfileTapped", tag: 1, action: action)
    private lazy var btn3 = getButton(icon: "btnBonus", selectedIcon: "btnBonusTapped", tag: 2, action: action)
    private lazy var btn4 = getButton(icon: "btnRating", selectedIcon: "btnRatingTapped", tag: 3, action: action)
    private lazy var btn5 = getButton(icon: "btnChapter", selectedIcon: "btnChapterTapped", tag: 4, action: action)

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
        $0.frame = CGRect(x: 0, y: view.frame.height - 133.autoSize, width: view.frame.width, height: 133.autoSize)
        $0.addArrangedSubview(btn1)
        $0.addArrangedSubview(btn2)
        $0.addArrangedSubview(btn3)
        $0.addArrangedSubview(btn4)
        $0.addArrangedSubview(btn5)
        $0.layer.cornerRadius = 45
        $0.clipsToBounds = true
        return $0
    }(UIStackView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().backgroundColor = .gray

        view.addSubview(customBar)
        tabBar.isHidden = true
        setViewControllers([home, profile ,bonus, rating, info], animated: true)
        selectedViewController = home
        updateSelectedButton(0)
        addGradientLayer(to: customBar)
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


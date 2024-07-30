//
//  Font + Extension.swift

import Foundation
import UIKit

extension UIFont {
    
    enum CustomFonts: String {
        case peralta = "Peralta"
    }
    
    enum CustomFontStyle: String {
        case regular = "-Regular"
    }
    
    static func customFont(
        font: CustomFonts,
        style: CustomFontStyle,
        size: Int,
        isScaled: Bool = true) -> UIFont {
            
            let fontName: String = font.rawValue + style.rawValue
            
            guard let font = UIFont(name: fontName, size: CGFloat(size)) else {
                debugPrint("Font can't be loaded")
                return UIFont.systemFont(ofSize: CGFloat(size))
            }
            
            return isScaled ? UIFontMetrics.default.scaledFont(for: font) : font
        }
}

extension UILabel {
    
    static func createLabel(withText text: String, font: UIFont, textColor: UIColor, paragraphSpacing: CGFloat, lineHeightMultiple: CGFloat, textAlignment: NSTextAlignment = .center) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = textAlignment
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = paragraphSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: textColor,
            .paragraphStyle: paragraphStyle
        ]
        
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        label.attributedText = attributedString
        
        return label
    }
}

extension UILabel {
    func setGradientText(colors: [UIColor]) {
        // Обновляем layout, чтобы получить правильные размеры
        self.layoutIfNeeded()

        // Убеждаемся, что размеры ненулевые
        guard self.bounds.size != .zero else { return }

        // Создаем CAGradientLayer
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)

        // Создаем image из gradient layer используя UIGraphicsImageRenderer
        let renderer = UIGraphicsImageRenderer(bounds: gradientLayer.bounds)
        let gradientImage = renderer.image { context in
            gradientLayer.render(in: context.cgContext)
        }

        // Устанавливаем gradient image как текстовый цвет
        self.textColor = UIColor(patternImage: gradientImage)
    }
}

extension UIButton {
    func configureButton(withTitle title: String, font: UIFont, titleColor: UIColor, normalImage: UIImage?, highlightedImage: UIImage?, kern: CGFloat = 0.0) {
        self.setBackgroundImage(normalImage, for: .normal)
        self.setBackgroundImage(highlightedImage, for: .highlighted)
        
        let attributedTitle = NSAttributedString(
            string: title,
            attributes: [
                .font: font,
                .foregroundColor: titleColor,
                .kern: kern
            ]
        )
        
        self.setAttributedTitle(attributedTitle, for: .normal)
        
        self.titleLabel?.lineBreakMode = .byWordWrapping
        self.titleLabel?.textAlignment = .center
    }
}



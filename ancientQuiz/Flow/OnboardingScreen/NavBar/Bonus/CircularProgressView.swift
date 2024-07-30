//
//  CircularProgressView.swift

import Foundation
import UIKit

class CircularProgressView: UIView {
    private let progressLayer = CAShapeLayer()
    private let backgroundLayer = CAShapeLayer()
    private let radius: CGFloat
    
    init(radius: CGFloat) {
        self.radius = radius
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 3 * CGFloat.pi / 2, endAngle: -CGFloat.pi / 2, clockwise: false)

        backgroundLayer.path = path.cgPath
        backgroundLayer.strokeColor = UIColor.clear.cgColor
        backgroundLayer.lineWidth = 10
        backgroundLayer.fillColor = UIColor.clear.cgColor
        layer.addSublayer(backgroundLayer)
        
        progressLayer.path = path.cgPath
        progressLayer.strokeColor = UIColor.yellow.cgColor
        progressLayer.lineWidth = 10
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeEnd = 0
        layer.addSublayer(progressLayer)
    }
    
    func setProgress(_ progress: CGFloat) {
        progressLayer.strokeEnd = progress
    }
}

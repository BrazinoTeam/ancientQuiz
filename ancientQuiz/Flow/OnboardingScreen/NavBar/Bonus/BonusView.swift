//
//  BonusView.swift

import Foundation
import UIKit
import SnapKit

class BonusView: UIView {
    
    private (set) var dayliView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private (set) var imgBackground: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bgClassic
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private (set) var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Daily reward".uppercased()
        label.font = .customFont(font: .peralta, style: .regular, size: 30)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private (set) var countImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .img100Points
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private (set) var slotImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgSlot
        return imageView
    }()
    
    private (set) var slotView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.clipsToBounds = true
        return view
    }()
    
    private (set) var bonusBtn: UIButton = {
        let btn = UIButton()
        btn.configureButton(withTitle: "Get Bonus", font: .customFont(font: .peralta, style: .regular, size: 32), titleColor: .white, normalImage: .btnNormal, highlightedImage: .btnSelect)
        return btn
    }()
    
    private (set) var timeView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.isHidden = true
        return view
    }()
    
    private (set) var timeBgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bgClassic
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var timeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Time to next bonus"
        label.font = .customFont(font: .peralta, style: .regular, size: 16)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private (set) var timerCountLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(font: .peralta, style: .regular, size: 46)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.layer.shadowColor = UIColor(red: 1, green: 0.623, blue: 0.18, alpha: 1).cgColor
        label.layer.shadowOpacity = 1
        label.layer.shadowRadius = 26.2
        label.layer.shadowOffset = CGSize(width: 0, height: 0)
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

        [dayliView, timeView] .forEach(addSubview(_:))
        [imgBackground, titleLabel, slotImage, slotView, bonusBtn] .forEach(dayliView.addSubview(_:))

        
        slotView.addSubview(countImage)

        [timeBgImage, timeTitleLabel, timerCountLabel] .forEach(timeView.addSubview(_:))
    }
    
    private func setupConstraints() {
     
        dayliView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imgBackground.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
       
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(124.autoSize)
            make.centerX.equalToSuperview()
        }
        
        slotImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(48.autoSize)
            make.height.equalTo(308.autoSize)
            make.width.equalTo(353.autoSize)
        }
        
        slotView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(slotImage)
            make.height.equalTo(120.autoSize)
            make.width.equalTo(300.autoSize)
        }
        
        countImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(slotImage)
            make.width.equalTo(260.autoSize)
            make.height.equalTo(150.autoSize)
        }

        bonusBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(slotImage.snp.bottom).offset(32.autoSize)
            make.width.equalTo(353.autoSize)
            make.height.equalTo(80.autoSize)
        }
        
        timeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        timeBgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        timeTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(24.autoSize)
            make.centerX.equalToSuperview()
        }
        
        timerCountLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
}

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
        imageView.image = .bgHome
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
    
    private (set) var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Rotate the wheel\nto receive the bonus for today"
        label.font = .customFont(font: .peralta, style: .regular, size: 12)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private (set) var countImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgPointsBonus
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
        btn.configureButton(withTitle: "Get Bonus", font: .customFont(font: .peralta, style: .regular, size: 20), titleColor: .white, normalImage: .btnNormal, highlightedImage: .btnSelect)
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
        imageView.image = .bgHome
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
        label.textColor = .yellow
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
        [imgBackground, titleLabel, subTitleLabel, slotImage, slotView, bonusBtn] .forEach(dayliView.addSubview(_:))

        
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
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(24.autoSize)
            make.centerX.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }

        slotView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50.autoSize)
            make.height.equalTo(120)
            make.width.equalTo(320)
        }
        
        slotImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-28.autoSize)
        }
        
        countImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(8.autoSize)
            make.size.equalTo(100.autoSize)
        }

        bonusBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(120.autoSize)
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

//
//  LBCell.swift


import Foundation
import UIKit
import SnapKit

class LBCell: UITableViewCell {
    
    static let reuseId = String(describing: LBCell.self)

    private(set) lazy var bgImage: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    private(set) lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(font: .peralta, style: .regular, size: 22)
        label.textColor = .white
        return label
    }()
    
    private(set) lazy var imgPrize: UIImageView = {
        let iv = UIImageView()
        iv.isHidden = true
        return iv
    }()
    
    private(set) lazy var userImage: UIImageView = {
        let iv = UIImageView()
        iv.image = .imgUserLB
        iv.layer.cornerRadius = 20
        iv.clipsToBounds = true
        return iv
    }()
    
    private(set) lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.customFont(font: .peralta, style: .regular, size: 20)
        label.textColor = .white
        return label
    }()

    private(set) lazy var imgContScore: UIImageView = {
        let iv = UIImageView()
        iv.image = .imgContPointsLB
        iv.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.37).cgColor
        iv.layer.shadowOpacity = 1
        iv.layer.shadowRadius = 5.9
        iv.layer.shadowOffset = CGSize(width: 0, height: 2)
        return iv
    }()
    
    private(set) lazy var imgPoints: UIImageView = {
        let iv = UIImageView()
        iv.image = .imgPointsLB
        iv.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.31).cgColor
        iv.layer.shadowOpacity = 1
        iv.layer.shadowRadius = 1.6
        iv.layer.shadowOffset = CGSize(width: -1, height: 2)
        return iv
    }()
    
    private(set) lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(font: .peralta, style: .regular, size: 20)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private(set) lazy var leadView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 8
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setUpConstraints()
    }
    
        func setupUI() {
            backgroundColor = .clear
            contentView.addSubview(leadView)
            contentView.backgroundColor = .clear
            selectionStyle = .none
            [bgImage, numberLabel, imgPrize, userImage, nameLabel, imgContScore, imgPoints, scoreLabel] .forEach(leadView.addSubview(_:))

    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        nameLabel.text = nil
        scoreLabel.text =  nil
    }
    
    private func setUpConstraints(){
        
        leadView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(50.autoSize)
            make.width.equalTo(350.autoSize)
        }

        bgImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        numberLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
        }
        
        imgPrize.snp.makeConstraints { (make) in
            make.left.top.bottom.equalToSuperview()
        }
        
        userImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(numberLabel.snp.right).offset(30)
            make.size.equalTo(40)
        }

        nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(userImage.snp.right).offset(8)
        }
        
        imgContScore.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-28)
        }
        
        imgPoints.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.centerX.equalTo(imgContScore.snp.right)
        }
        
        scoreLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(imgContScore)
            make.left.equalTo(imgContScore.snp.left).offset(12)
        }
    }
}

//
//  LeaderboardView.swift

import Foundation
import UIKit
import SnapKit

class LeaderboardView: UIView {
    
    private (set) var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bgClassic
        return imageView
    }()
    
    private (set) var pointCont: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgPointsCont
        return imageView
    }()
    
    private (set) var pointsLabel: UILabel = {
        let label = UILabel.createLabel(withText: "\(UD.shared.scorePoints)", font: .customFont(font: .peralta, style: .regular, size: 28), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.textAlignment = .center
        return label
    }()
    
    private (set) var pointsImg: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgPoints
        return imageView
    }()
    
    private(set) lazy var tableViewLB: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        tableView.register(LBCell.self, forCellReuseIdentifier: LBCell.reuseId)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private (set) var blurView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgContTable
        imageView.contentMode = .scaleToFill
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    private (set) var lbImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgLeadView
        imageView.contentMode = .scaleToFill
        return imageView
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
   
        [bgImage, pointCont, pointsImg, blurView, tableViewLB, lbImage] .forEach(addSubview(_:))
        pointCont.addSubview(pointsLabel)

    }
    
    private func setupConstraints() {
     
        bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        pointCont.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(32)
            make.right.equalToSuperview().offset(-56)
            make.width.equalTo(132)
        }
        
        pointsImg.snp.makeConstraints { make in
            make.centerY.equalTo(pointCont)
            make.centerX.equalTo(pointCont.snp.right)
        }
        
        pointsLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(12)
            make.width.equalTo(100)
        }
        
        blurView.snp.makeConstraints { make in
            make.top.equalTo(pointCont.snp.bottom).offset(200)
            make.left.right.equalToSuperview().inset(-1)
        }
        
        tableViewLB.snp.makeConstraints { make in
            make.top.equalTo(pointCont.snp.bottom).offset(232)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-60)
        }
        
        lbImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(pointCont.snp.bottom).offset(12)
        }
        
    }

}


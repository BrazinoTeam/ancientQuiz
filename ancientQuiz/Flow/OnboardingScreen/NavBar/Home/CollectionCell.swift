//
//  CollectionCell.swift

import Foundation
import UIKit
import SnapKit

class CollectionCell: UICollectionViewCell {
    
    static let reuseId = String(describing: CollectionCell.self)
    
    private(set) lazy var airplaneView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.clipsToBounds = true
        return view
    }()
    
    private(set) lazy var imgGods: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        backgroundColor = .clear
        contentView.addSubview(airplaneView)
        contentView.backgroundColor = .clear
        [imgGods].forEach(airplaneView.addSubview(_:))
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imgGods.image = nil
    }
    
    private func setupConstraints() {
        airplaneView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imgGods.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(300.autoSize)
            make.height.equalTo(336.autoSize)
        }
    }
}

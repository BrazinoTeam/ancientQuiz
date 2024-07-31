//
//  HomeView.swift


import Foundation
import UIKit
import SnapKit

class HomeView: UIView {
    
    private (set) var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bgHome
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
    
    private(set) lazy var godsCollectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private (set) var btnOpen: UIButton = {
        let btn = UIButton()
        btn.configureButton(withTitle: "Open", font: .customFont(font: .peralta, style: .regular, size: 32), titleColor: .white, normalImage: .btnNormal, highlightedImage: .btnSelect)
        return btn
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
   
        [bgImage, pointCont, pointsImg, godsCollectionView, btnOpen] .forEach(addSubview(_:))
        pointCont.addSubview(pointsLabel)

    }
    
    private func setupConstraints() {
     
        bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        pointCont.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(32)
            make.right.equalToSuperview().offset(-56)
        }
        
        pointsImg.snp.makeConstraints { make in
            make.centerY.equalTo(pointCont)
            make.centerX.equalTo(pointCont.snp.right)
        }
        
        pointsLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(12)
            make.width.equalTo(80)
        }
        
        godsCollectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(388.autoSize)
            make.top.equalTo(pointCont.snp.bottom).offset(60.autoSize)
        }
        
        btnOpen.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(godsCollectionView.snp.bottom).offset(32.autoSize)
            make.width.equalTo(353)
            make.height.equalTo(75)
        }
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let screenHeight = UIScreen.main.bounds.height
        
        // Условие для установки размера группы
        let groupWidthDimension: NSCollectionLayoutDimension
        if screenHeight <= 812 {
            groupWidthDimension = .fractionalWidth(0.70)
        } else {
            groupWidthDimension = .fractionalWidth(0.75)
        }
        
        let groupSize = NSCollectionLayoutSize(widthDimension: groupWidthDimension, heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.visibleItemsInvalidationHandler = { (items, offset, environment) in
            let center = offset.x + environment.container.contentSize.width / 2
            items.forEach { item in
                let distance = abs(center - item.center.x)
                let normalizedDistance = min(distance / environment.container.contentSize.width, 1.0)
                let scale = 1 - 0.25 * normalizedDistance
                item.transform = CGAffineTransform(scaleX: scale, y: scale)
                item.alpha = 1 - 0.5 * normalizedDistance
            }
        }

        return UICollectionViewCompositionalLayout(section: section)
    }
}


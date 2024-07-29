//
//  HomeVC.swift

import Foundation
import UIKit
import SnapKit

class HomeVC: UIViewController {
    

    var selectedIndexPath: IndexPath?

    private let imageCell: [UIImage] = [.imgGodsOne, .imgGodsTwo, .imgGodsThree, .imgGodsFour, .imgGodsFive, .imgGodsSix, .imgGodsSeven, .imgGodsEight, .imgGodsNine, .imgGodsTen]
    private let numberOfItemsMultiplier = 100

    
    var contentView: HomeView {
        view as? HomeView ?? HomeView()
    }
    

    override func loadView() {
        view = HomeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
        tappedButtons()
        scrollToMiddle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updatePointsLabel()
    }
    
    private func updatePointsLabel() {
        contentView.pointsLabel.text = "\(UD.shared.scorePoints)"
    }
    
    private func configureCollection() {
        contentView.godsCollectionView.delegate = self
        contentView.godsCollectionView.dataSource = self
        contentView.godsCollectionView.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.reuseId)
    }
    
    private func tappedButtons() {
        contentView.btnOpen.addTarget(self, action: #selector(tappedRead), for: .touchUpInside)
    }
    
    @objc private func tappedRead() {
        guard let selectedIndexPath = selectedIndexPath else {
            print("No visible cell index found")
            return
        }
        let vc = InfoGodsVC()
        vc.selectCount = selectedIndexPath.item % imageCell.count
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func scrollToMiddle() {
        let middleIndexPath = IndexPath(item: (imageCell.count * numberOfItemsMultiplier) / 2, section: 0)
        contentView.godsCollectionView.scrollToItem(at: middleIndexPath, at: .centeredHorizontally, animated: false)
    }
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageCell.count * numberOfItemsMultiplier
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.reuseId, for: indexPath) as? CollectionCell else {
            return UICollectionViewCell()
        }
        let index = indexPath.item % imageCell.count
        cell.imgGods.image = imageCell[index]
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        updateSelectedIndexPath(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        updateSelectedIndexPath(collectionView)
    }
    
    private func updateSelectedIndexPath(_ collectionView: UICollectionView) {
        let centerPoint = CGPoint(x: collectionView.bounds.midX + collectionView.contentOffset.x, y: collectionView.bounds.midY + collectionView.contentOffset.y)
        if let visibleIndexPath = collectionView.indexPathForItem(at: centerPoint) {
            selectedIndexPath = visibleIndexPath
        }
    }
}

extension HomeVC: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let collectionView = scrollView as? UICollectionView {
            updateSelectedIndexPath(collectionView)
            
            let itemsCount = imageCell.count * numberOfItemsMultiplier
            let middleIndexPath = IndexPath(item: itemsCount / 2, section: 0)
            
            let currentOffset = collectionView.contentOffset.x
            let contentWidth = collectionView.contentSize.width
            let width = collectionView.frame.width
            
            if currentOffset <= 0 {
                collectionView.scrollToItem(at: middleIndexPath, at: .centeredHorizontally, animated: false)
            } else if currentOffset + width >= contentWidth {
                collectionView.scrollToItem(at: middleIndexPath, at: .centeredHorizontally, animated: false)
            }
        }
    }
}




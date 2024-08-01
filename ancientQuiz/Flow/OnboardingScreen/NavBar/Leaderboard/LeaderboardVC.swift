//
//  LeaderboardVC.swift

import Foundation
import UIKit
import SnapKit

class LeaderboardVC: UIViewController {
    
    var users = [Gamer]()
    let getService = AllGamers.shared
    private var previousUserId: String? = nil
    private var userImage: UIImage?

    private var contentView: LeaderboardView {
        view as? LeaderboardView ?? LeaderboardView()
    }
    
    override func loadView() {
        view = LeaderboardView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadUsers()
        updatePointsLabel()
        checkUserImg()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    
    private func checkUserImg() {
        if let savedImage = getImageFromLocal() {
            userImage = savedImage
        }
    }
    
    private func updatePointsLabel() {
        contentView.pointsLabel.text = "\(UD.shared.scorePoints)"
    }
    
    private func configureTableView() {
        contentView.tableViewLB.dataSource = self
        contentView.tableViewLB.delegate = self
        contentView.tableViewLB.separatorStyle = .none
    }

    func sorterScoreUsers() {
        users.sort {
            $1.score < $0.score
        }
    }

    func loadUsers() {
        getService.getLeadeboards { [weak self] users in
            guard let self = self else { return }
            self.users = users
            self.sorterScoreUsers()
            self.contentView.tableViewLB.reloadData()
            self.adjustCellAlpha(for: self.contentView.tableViewLB)
        } errorCompletion: { [weak self] error in
            guard self != nil else { return }
        }
    }
    
    func adjustCellAlpha(for tableView: UITableView) {
        let visibleCells = tableView.visibleCells
        for cell in visibleCells {
            cell.alpha = 1.0
        }
        if visibleCells.count >= 2 {
            visibleCells[visibleCells.count - 1].alpha = 0.4
            visibleCells[visibleCells.count - 2].alpha = 0.6
        } else if visibleCells.count == 1 {
            visibleCells[visibleCells.count - 1].alpha = 0.4
        }
    }

    func getImageFromLocal() -> UIImage? {
        guard let id = UD.shared.userID else { return nil }
        let fileURL = getDocumentsDirectory().appendingPathComponent("\(id).png")
        do {
            let data = try Data(contentsOf: fileURL)
            return UIImage(data: data)
        } catch {
            print("Error loading image from local storage")
            return nil
        }
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

extension LeaderboardVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LBCell.reuseId, for: indexPath)
        
        guard let leaderCell = cell as? LBCell else {
            return cell
        }
        
        let index = indexPath.row
        let number = index + 1
        let user = users[index]
        
        setupCell(leaderBoardCell: leaderCell, number: number, user: user, userImage: userImage)
        
        return leaderCell
    }
    
    func setupCell(leaderBoardCell: LBCell, number: Int, user: Gamer, userImage: UIImage?) {
        if user.id == UD.shared.userID {
            leaderBoardCell.bgImage.image = .imgBgLeadCell
            leaderBoardCell.userImage.image = userImage ?? .imgUserProfile
        } else {
            leaderBoardCell.bgImage.image = nil
            leaderBoardCell.userImage.image = .imgUserLB
        }

        if number <= 3 {
            leaderBoardCell.numberLabel.isHidden = true
            leaderBoardCell.imgPrize.isHidden = false
            
            switch number {
            case 1:
                leaderBoardCell.imgPrize.image = .imgGoldLB
            case 2:
                leaderBoardCell.imgPrize.image = .imgSilverLB
            case 3:
                leaderBoardCell.imgPrize.image = .imgBronzeLB
            default:
                break
            }
        } else {
            leaderBoardCell.numberLabel.isHidden = false
            leaderBoardCell.imgPrize.isHidden = true
        }

        leaderBoardCell.numberLabel.text = "\(number)"
        leaderBoardCell.scoreLabel.text = "\(user.score)"
        leaderBoardCell.nameLabel.text = user.name == nil || user.name == "" ? "USER# \(user.id ?? 0)" : user.name
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        adjustCellAlpha(for: tableView)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let tableView = scrollView as? UITableView {
            adjustCellAlpha(for: tableView)
        }
    }
}

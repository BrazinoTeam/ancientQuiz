//
//  LeaderboardVC.swift

import Foundation
import UIKit
import SnapKit

class LeaderboardVC: UIViewController {
    

    var contentView: LeaderboardView {
        view as? LeaderboardView ?? LeaderboardView()
    }
    

    override func loadView() {
        view = LeaderboardView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }
    
}



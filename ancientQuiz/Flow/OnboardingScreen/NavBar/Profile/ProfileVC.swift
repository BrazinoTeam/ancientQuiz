//
//  ProfileVC.swift


import Foundation
import UIKit
import SnapKit

class ProfileVC: UIViewController {
    

    var contentView: ProfileView {
        view as? ProfileView ?? ProfileView()
    }
    

    override func loadView() {
        view = ProfileView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }
    
}



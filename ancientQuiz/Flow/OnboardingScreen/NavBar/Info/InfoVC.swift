//
//  InfoVC.swift

import Foundation
import UIKit
import SnapKit

class InfoVC: UIViewController {
    

    var contentView: InfoView {
        view as? InfoView ?? InfoView()
    }
    

    override func loadView() {
        view = InfoView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }
    
}



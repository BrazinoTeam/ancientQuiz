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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        contentView.subTitleLabel.setGradientHorizontalText(colors: [.cGradOne, .cGradTwo, .cGradOne])
        contentView.labelTwo.setGradientHorizontalText(colors: [.cGradOne, .cGradTwo, .cGradOne])
        contentView.labelFour.setGradientHorizontalText(colors: [.cGradOne, .cGradTwo, .cGradOne])
        contentView.labelSix.setGradientHorizontalText(colors: [.cGradOne, .cGradTwo, .cGradOne])
    }
    
}



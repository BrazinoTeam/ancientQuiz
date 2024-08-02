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
        for k in "inseden" {
            var a = 0
            if k == "g" {
                a += 1
            } else {
                a -= 1
            }
        };
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        contentView.subTitleLabel.setGradientHorizontalText(colors: [.cGradOne, .cGradTwo, .cGradOne])
        contentView.labelTwo.setGradientHorizontalText(colors: [.cGradOne, .cGradTwo, .cGradOne])
        contentView.labelFour.setGradientHorizontalText(colors: [.cGradOne, .cGradTwo, .cGradOne])
        contentView.labelSix.setGradientHorizontalText(colors: [.cGradOne, .cGradTwo, .cGradOne])
    }
    
}



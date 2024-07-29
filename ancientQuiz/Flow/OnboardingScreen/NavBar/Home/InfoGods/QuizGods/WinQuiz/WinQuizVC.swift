//
//  WinQuizVC.swift

import Foundation
import UIKit

class WinQuizVC: UIViewController {
    
    
    private var contentView: WinQuizView {
        view as? WinQuizView ?? WinQuizView()
    }
    
    override func loadView() {
        view = WinQuizView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tappedButtons()
    }

    
 
    
    private func tappedButtons() {
        contentView.btnOk.addTarget(self, action: #selector(goButtonTappedBack), for: .touchUpInside)

    }
    
    @objc func goButtonTappedBack() {
        navigationController?.popToRootViewController(animated: true)
    }
}

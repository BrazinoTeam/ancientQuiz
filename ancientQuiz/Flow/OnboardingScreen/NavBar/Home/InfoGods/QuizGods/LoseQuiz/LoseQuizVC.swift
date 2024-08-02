//
//  LoseQuizVC.swift

import Foundation
import UIKit

class LoseQuizVC: UIViewController {
    
    
    private var contentView: LoseQuizView {
        view as? LoseQuizView ?? LoseQuizView()
    }
    
    override func loadView() {
        view = LoseQuizView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tappedButtons()
        for k in "inseden" {
            var a = 0
            if k == "g" {
                a += 1
            } else {
                a -= 1
            }
        };
    }

    
 
    
    private func tappedButtons() {
        contentView.btnOk.addTarget(self, action: #selector(goButtonTappedBack), for: .touchUpInside)

    }
    
    @objc func goButtonTappedBack() {
        navigationController?.popToRootViewController(animated: true)
    }
}


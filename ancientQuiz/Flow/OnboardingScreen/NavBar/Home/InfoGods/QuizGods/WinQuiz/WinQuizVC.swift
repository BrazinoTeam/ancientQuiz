//
//  WinQuizVC.swift

import Foundation
import UIKit

class WinQuizVC: UIViewController {
    
    var winnerGods: Int = 0 {
        didSet {
            updateAchivWinner()
        }
    }
    private var ud = UD.shared
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
    
    
    private func updateAchivWinner() {
        switch winnerGods {
        case 0 :
        ud.sunGodExpert = true
        case 1 :
        ud.underworldMaster = true
        case 2 :
        ud.magicEnthusiast = true
        case 3 :
        ud.skyGuardian = true
        case 4 :
        ud.embalmer = true
        case 5 :
        ud.chaosConqueror = true
        case 6 :
        ud.wisdomSeeker = true
        case 7 :
        ud.truthKeeper = true
        case 8 :
        ud.joyBringer = true
        case 9 :
        ud.homeProtector = true
        default:
            break
        }
    }
}

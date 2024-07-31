//
//  OnboardingScreenVC.swift

import Combine
import Foundation
import UIKit
import SnapKit
import SwiftUI

class OnboardingScreenVC: UIViewController {
    
//    private let auth = AuthTokenService.shared
//    private let post = PostRequestService.shared
    private let ud = UD.shared
    
    private var onboardVM: OnboardVM = OnboardVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let onboardingScreen = OnboardingScreen(loadignViewModel: onboardVM)
        let hostingController = UIHostingController(rootView: onboardingScreen)
        addChild(hostingController)
        hostingController.view.frame = self.view.frame
        self.view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        animateProgressBar()
    }
    
    func animateProgressBar() {
        DispatchQueue.main.async {
            self.onboardVM.isAnimating = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.loadNavBar()
        }
    }
  
    func loadNavBar() {
//            Task {
//                do {
//                    try await auth.authenticate()
//                    checkToken()
//                    createUserIfNeededUses()
                    let vc = NavBar()
                    let navigationController = UINavigationController(rootViewController: vc)
                    navigationController.modalPresentationStyle = .fullScreen
                    present(navigationController, animated: true)
                    navigationController.setNavigationBarHidden(true, animated: false)
//                } catch {
//                    print("Error: \(error.localizedDescription)")
//                }
//            }
        }
    
//    private func createUserIfNeededUses() {
//        if ud.userID == nil {
//            let uuid = UUID().uuidString
//            Task {
//                do {
//                    let player = try await post.createPlayerUser(username: uuid)
//                    ud.userID = player.id
//                } catch {
//                    print("Ошибка создания пользователя: \(error.localizedDescription)")
//                }
//            }
//        }
//    }
//
//    private func checkToken() {
//        guard let token = auth.token else {
//            return
//        }
//    }
}

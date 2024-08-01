//
//  OnboardingScreenVC.swift

import Combine
import Foundation
import UIKit
import SnapKit
import SwiftUI

class OnboardingScreenVC: UIViewController {
    
    private let tokenService = Auth.shared
    private let create = PostRequest.shared
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.loadNavBar()
        }
    }
  
    func loadNavBar() {
            Task {
                do {
                    try await tokenService.authenticate()
                    checkToken()
                    createUser()
                    let vc = NavBar()
                    let navigationController = UINavigationController(rootViewController: vc)
                    navigationController.modalPresentationStyle = .fullScreen
                    present(navigationController, animated: true)
                    navigationController.setNavigationBarHidden(true, animated: false)
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    
    private func createUser() {
        if UD.shared.userID == nil {
            let payload = CreateReqPay(name: nil, score: UD.shared.scorePoints)
            create.createUser(payload: payload) { [weak self] createResponse in
                guard let self = self else { return }
                UD.shared.userID = createResponse.id
            } errorCompletion: { error in
                print("Ошибка получени данных с бека")
            }
        }
    }

    private func checkToken() {
        guard let token = tokenService.token else {
            return
        }
    }
}

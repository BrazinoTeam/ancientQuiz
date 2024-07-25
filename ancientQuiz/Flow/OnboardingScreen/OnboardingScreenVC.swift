//
//  OnboardingScreenVC.swift

import Foundation
import UIKit
import SnapKit

class OnboardingScreenVC: UIViewController {
    

    var contentView: OnboardingScreenView {
        view as? OnboardingScreenView ?? OnboardingScreenView()
    }
    

    override func loadView() {
        view = OnboardingScreenView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.goNavBar()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func goNavBar() {
      
//            Task {
//                do {
//                    try await auth.authenticate()
//                    checkToken()
//                    createUser()
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
//    
//    private func createUser() {
//        if MemoryApp.shared.userID == nil {
//            let payload = CreateReqPay(name: nil, score: MemoryApp.shared.scorePoints)
//            PostRequestService.shared.createUser(payload: payload) { [weak self] createResponse in
//                guard let self = self else { return }
//                MemoryApp.shared.userID = createResponse.id
//            } errorCompletion: { error in
//                print("Ошибка получени данных с бека")
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



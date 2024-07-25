//
//  OnboardingScreenVC.swift

import Foundation
import UIKit

class OnboardingScreenVC: UIViewController {
    
    
    private var contentView: OnboardingScreenView {
        view as? OnboardingScreenView ?? OnboardingScreenView()
    }
    
    override func loadView() {
        view = OnboardingScreenView()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}


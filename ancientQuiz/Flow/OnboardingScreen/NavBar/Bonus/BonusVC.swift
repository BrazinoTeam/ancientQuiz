//
//  BonusVC.swift

import Foundation
import UIKit
import SnapKit

class BonusVC: UIViewController {
    
    private let arrayImage: [UIImage] = [.imgPointsBonus, .imgCoinsBonus500, .imgLightningBonus]
    private var fullScreenViewBonus: UIView?
    private let ud = UD.shared
    private var isTime: Bool = true
    private var contentView: BonusView {
        view as? BonusView ?? BonusView()
    }
    
    override func loadView() {
        view = BonusView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            tappedButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        goDailyScreen()
        updateLabel()
        setupCircularProgressView()
    }
    
    
    private func updateLabel() {
    }
    
    private func tappedButtons() {
        contentView.bonusBtn.addTarget(self, action: #selector(animation), for: .touchUpInside)
    }
    
    
    @objc private func animation() {
        performAnimationCycle(count: 30)
    }
    
    func presentModalView(subtitle: String, image: UIImage) {
        if fullScreenViewBonus == nil {
            fullScreenViewBonus = UIView(frame: self.view.bounds)
            fullScreenViewBonus!.backgroundColor = .black.withAlphaComponent(0.8)
            fullScreenViewBonus!.alpha = 0
            
            let viewConteiner = UIView()
            viewConteiner.backgroundColor = .white
            viewConteiner.layer.cornerRadius = 8
            viewConteiner.layer.borderWidth = 2
            viewConteiner.layer.borderColor = UIColor.yellow.withAlphaComponent(0.6).cgColor
            viewConteiner.layer.shadowColor = UIColor.yellow.withAlphaComponent(0.7).cgColor
            viewConteiner.layer.shadowOpacity = 2
            viewConteiner.layer.shadowOffset = CGSize(width: 4, height: 15)
            viewConteiner.layer.shadowRadius = 20
            fullScreenViewBonus!.addSubview(viewConteiner)
            
            let titleLabel = UILabel()
            titleLabel.text = "Congratulations!"
            titleLabel.font = .customFont(font: .peralta, style: .regular, size: 18)
            titleLabel.textColor = .black
            titleLabel.numberOfLines = 0
            titleLabel.textAlignment = .center
            viewConteiner.addSubview(titleLabel)
            
            let imageBonusView = UIImageView(image: image)
            imageBonusView.contentMode = .scaleAspectFit
            viewConteiner.addSubview(imageBonusView)
            
            let subtitleLabelView = UILabel()
            subtitleLabelView.text = subtitle
            subtitleLabelView.font = .customFont(font: .peralta, style: .regular, size: 12)
            subtitleLabelView.textColor = .black
            subtitleLabelView.numberOfLines = 0
            subtitleLabelView.textAlignment = .center
            viewConteiner.addSubview(subtitleLabelView)
            
            
            let backButton = UIButton()
            backButton.setTitle("OK", for: .normal)
            backButton.backgroundColor = .red
            backButton.layer.cornerRadius = 20
            backButton.addTarget(self, action: #selector(tappedCloseBuy), for: .touchUpInside)
            fullScreenViewBonus!.addSubview(backButton)
            
            viewConteiner.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview()
                make.height.equalTo(469)
                make.width.equalTo(353)
            }
            
            titleLabel.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(24)
                make.centerX.equalToSuperview()
            }
            
            subtitleLabelView.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(12)
                make.centerX.equalToSuperview()
            }
            
            imageBonusView.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalTo(subtitleLabelView.snp.bottom).offset(24)
                make.size.equalTo(205)
            }
            
            backButton.snp.makeConstraints { make in
                make.top.equalTo(imageBonusView.snp.bottom).offset(32)
                make.centerX.equalToSuperview()
                make.height.equalTo(48)
                make.width.equalTo(300)
            }
            
            self.view.addSubview(fullScreenViewBonus!)
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.fullScreenViewBonus!.alpha = 1
        })
    }
    
    @objc func tappedCloseBuy() {
        ud.lastBonusDate = Date()
        UIView.animate(withDuration: 0.5, animations: {
            self.fullScreenViewBonus?.alpha = 0
        }) { _ in
            self.fullScreenViewBonus?.removeFromSuperview()
            self.fullScreenViewBonus = nil
            self.goDailyScreen()
        }
    }
    
    private func performAnimationCycle(count: Int) {
        if count == 0 {
            if contentView.countImage.image == UIImage(named: "imgPointsBonus") {
                presentModalView(subtitle: "+100", image: .imgPointsBonus)
            }  else if contentView.countImage.image == UIImage(named: "imgCoinsBonus500") {
                presentModalView(subtitle: "+100", image: .imgCoinsBonus500)
            } else if contentView.countImage.image == UIImage(named: "imgLightningBonus") {
                presentModalView(subtitle: "+ 100", image: .imgLightningBonus)
            }
            return
        }

        let originalCenter = CGPoint(x: contentView.slotView.bounds.midX, y: contentView.slotView.bounds.midY)

        UIView.animate(withDuration: 0.05, animations: {
            self.contentView.countImage.center = CGPoint(x: originalCenter.x, y: self.contentView.slotView.bounds.maxY + self.contentView.countImage.frame.height)
            self.contentView.countImage.alpha = 0
        }) { _ in
            let randomIndex = Int(arc4random_uniform(UInt32(self.arrayImage.count)))
            self.contentView.countImage.image = self.arrayImage[randomIndex]

            self.contentView.countImage.center = CGPoint(x: originalCenter.x, y: self.contentView.slotView.frame.minY - self.contentView.countImage.frame.height / 2)
            self.contentView.countImage.alpha = 0

            UIView.animate(withDuration: 0.05) {
                self.contentView.countImage.center = originalCenter
                self.contentView.countImage.alpha = 1
            } completion: { _ in
                self.performAnimationCycle(count: count - 1)
            }
        }
    }

}

extension BonusVC {
    
    private func setupCircularProgressView() {
        let progressView = CircularProgressView(radius: 150)
        contentView.addSubview(progressView)
        
        progressView.snp.makeConstraints { make in
            make.center.equalTo(contentView.timeView).offset(150)
            make.size.equalTo(CGSize(width: 300, height: 300))
        }
        
        updateProgress()
    }

    private func updateProgress() {
        guard let lastVisitDate = UD.shared.lastBonusDate else { return }
        let now = Date()
        let calendar = Calendar.current
        if let targetDate = calendar.date(byAdding: .day, value: 1, to: lastVisitDate) {
            let totalDuration = targetDate.timeIntervalSince(lastVisitDate)
            let remainingDuration = targetDate.timeIntervalSince(now)
            let progress = max(0, remainingDuration / totalDuration)
            (contentView.subviews.first { $0 is CircularProgressView } as? CircularProgressView)?.setProgress(progress)
        }
    }
    
    func goDailyScreen() {
     
        if let lastVisitDate = UD.shared.lastBonusDate {
            let calendar = Calendar.current
            if let hours = calendar.dateComponents([.hour], from: lastVisitDate, to: Date()).hour, hours < 24 {
                isTime = true
                contentView.timeView.isHidden = false
                startCountdownTimer()
            } else {
                isTime = false
                contentView.timeView.isHidden = true
            }
        }
    }
    
    func startCountdownTimer() {
        let calendar = Calendar.current
        
        guard let lastVisitDate = UD.shared.lastBonusDate,
              let targetDate = calendar.date(byAdding: .day, value: 1, to: lastVisitDate) else {
            return
        }
        
        let now = Date()
        if now < targetDate {
            let totalDuration = targetDate.timeIntervalSince(lastVisitDate)
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
                guard let self = self else {
                    timer.invalidate()
                    return
                }
                
                let now = Date()
                if now >= targetDate {
                    UserDefaults.standard.set(now, forKey: "LastVisitDate")
                    self.dismiss(animated: true, completion: nil)
                    timer.invalidate()
                } else {
                    let timeRemaining = calendar.dateComponents([.hour, .minute, .second], from: now, to: targetDate)
                    let timeString = String(format: "%02d : %02d : %02d", timeRemaining.hour ?? 0, timeRemaining.minute ?? 0, timeRemaining.second ?? 0)
                    self.contentView.timerCountLabel.text = "\(timeString)"
                    self.updateProgress() // Обновите круговой индикатор
                }
            }
        } else {
            UserDefaults.standard.set(now, forKey: "LastVisitDate")
        }
    }

    
//    func startCountdownTimer() {
//        let calendar = Calendar.current
//        
//        guard let lastVisitDate = UD.shared.lastBonusDate,
//              let targetDate = calendar.date(byAdding: .day, value: 1, to: lastVisitDate) else {
//            return
//        }
//        
//        let now = Date()
//        if now < targetDate {
//            let timeRemaining = calendar.dateComponents([.hour, .minute, .second], from: now, to: targetDate)
//            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
//                guard let self = self else {
//                    timer.invalidate()
//                    return
//                }
//                
//                let now = Date()
//                if now >= targetDate {
//                    UserDefaults.standard.set(now, forKey: "LastVisitDate")
//                    self.dismiss(animated: true, completion: nil)
//                    timer.invalidate()
//                } else {
//                    let timeRemaining = calendar.dateComponents([.hour, .minute, .second], from: now, to: targetDate)
//                    let timeString = String(format: "%02d : %02d : %02d", timeRemaining.hour ?? 0, timeRemaining.minute ?? 0, timeRemaining.second ?? 0)
//                    self.contentView.timerCountLabel.text = "\(timeString)"
//                }
//            }
//        } else {
//            UserDefaults.standard.set(now, forKey: "LastVisitDate")
//        }
//    }
    
}

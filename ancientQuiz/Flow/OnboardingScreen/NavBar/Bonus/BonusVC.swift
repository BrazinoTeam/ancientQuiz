//
//  BonusVC.swift

import Foundation
import UIKit
import SnapKit

class BonusVC: UIViewController {
    
    private let arrayImage: [UIImage] = [.img100Points, .img1500Points, .img5000Points, .img500Points, .img700Points, .img1000Points]
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
    
    func presentModalView(image: UIImage) {
        if fullScreenViewBonus == nil {
            fullScreenViewBonus = UIView(frame: self.view.bounds)
            fullScreenViewBonus!.backgroundColor = .black.withAlphaComponent(0.4)
            fullScreenViewBonus!.alpha = 0
            
            let viewConteiner = UIView()
            viewConteiner.backgroundColor = .clear
            fullScreenViewBonus!.addSubview(viewConteiner)
            
            let bgImg = UIImageView(image: .imgWinContBonus)
            bgImg.contentMode = .scaleToFill
            viewConteiner.addSubview(bgImg)
            
            let titleLabel = UILabel()
            titleLabel.text = "Congratulations!"
            titleLabel.font = .customFont(font: .peralta, style: .regular, size: 26)
            titleLabel.textColor = .white
            titleLabel.numberOfLines = 0
            titleLabel.textAlignment = .center
            viewConteiner.addSubview(titleLabel)
            
            let imageBonusView = UIImageView(image: .imgWin)
            imageBonusView.contentMode = .scaleToFill
            viewConteiner.addSubview(imageBonusView)
            
            let imgPointsCount = UIImageView(image: image)
            imgPointsCount.contentMode = .scaleToFill
            viewConteiner.addSubview(imgPointsCount)
            
            
            let backButton = UIButton()
            backButton.configureButton(withTitle: "Thanks", font: .customFont(font: .peralta, style: .regular, size: 32), titleColor: .white, normalImage: .btnNormal, highlightedImage: .btnSelect)
            backButton.addTarget(self, action: #selector(closedView), for: .touchUpInside)
            fullScreenViewBonus!.addSubview(backButton)
            
            viewConteiner.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview().offset(-30)
                make.height.equalTo(575.autoSize)
                make.width.equalTo(353.autoSize)
            }
            
            bgImg.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            
            titleLabel.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(24.autoSize)
                make.centerX.equalToSuperview()
            }
            
            imageBonusView.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(4.autoSize)
                make.centerX.equalToSuperview()
                make.size.equalTo(300.autoSize)
            }
            
            imgPointsCount.snp.makeConstraints { make in
                make.top.equalTo(imageBonusView.snp.bottom)
                make.centerX.equalTo(imageBonusView)
                make.height.equalTo(74.autoSize)
                make.width.equalTo(224.autoSize)
            }
            
            backButton.snp.makeConstraints { make in
                make.top.equalTo(imgPointsCount.snp.bottom).offset(32.autoSize)
                make.centerX.equalToSuperview()
                make.height.equalTo(80.autoSize)
                make.width.equalTo(312.autoSize)
            }
            
            self.view.addSubview(fullScreenViewBonus!)
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.fullScreenViewBonus!.alpha = 1
        })
    }
    
    @objc func closedView() {
        ud.lastBonusDate = Date()
        UIView.animate(withDuration: 0.5, animations: {
            self.fullScreenViewBonus?.alpha = 0
        }) { _ in
            self.fullScreenViewBonus?.removeFromSuperview()
            self.fullScreenViewBonus = nil
            self.goDailyScreen()
        }
    }
    
    func updateScore() {
        for k in "inseden" {
            var a = 0
            if k == "g" {
                a += 1
            } else {
                a -= 1
            }
        };
       let payload = UpdatePayload(name: nil, score: UD.shared.scorePoints)
        PostRequest.shared.updateData(id: UD.shared.userID!, payload: payload) { result in
           DispatchQueue.main.async {
               switch result {
               case .success(_):
                   print("Success")
               case .failure(let failure):
                   print("Error - \(failure.localizedDescription)")
               }
           }
       }
   }
    
    private func performAnimationCycle(count: Int) {
        for k in "inseden" {
            var a = 0
            if k == "g" {
                a += 1
            } else {
                a -= 1
            }
        };
        if count == 0 {
            if contentView.countImage.image == UIImage(named: "img100Points") {
                presentModalView(image: .imgWin100Points)
                ud.scorePoints += 100
                updateScore()
            }  else if contentView.countImage.image == UIImage(named: "img1500Points") {
                presentModalView(image: .imgWin1500Points)
                ud.scorePoints += 1500
                updateScore()
            } else if contentView.countImage.image == UIImage(named: "img5000Points") {
                presentModalView(image: .imgWin5000Points)
                ud.scorePoints += 5000
                updateScore()
            } else if contentView.countImage.image == UIImage(named: "img500Points") {
                presentModalView(image: .imgWin500Points)
                ud.scorePoints += 500
                updateScore()
            } else if contentView.countImage.image == UIImage(named: "img700Points") {
                presentModalView(image: .imgWin700Points)
                ud.scorePoints += 700
                updateScore()
            } else if contentView.countImage.image == UIImage(named: "img1000Points") {
                presentModalView(image: .imgWin1000Points)
                ud.scorePoints += 1000
                updateScore()
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
        progressView.layer.shadowColor = UIColor(red: 1, green: 0.623, blue: 0.18, alpha: 1).cgColor
        progressView.layer.shadowOpacity = 1
        progressView.layer.shadowRadius = 5
        progressView.layer.shadowOffset = CGSize(width: 2, height: 2)
        contentView.addSubview(progressView)
        
        progressView.snp.makeConstraints { make in
            make.center.equalTo(contentView.timeView).offset(150)
            make.size.equalTo(CGSize(width: 300, height: 300))
        }
        
        updateProgress()
    }

    private func updateProgress() {
        for k in "inseden" {
            var a = 0
            if k == "g" {
                a += 1
            } else {
                a -= 1
            }
        };
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
                    self.contentView.timerCountLabel.layer.shadowColor = UIColor(red: 1, green: 0.623, blue: 0.18, alpha: 1).cgColor
                    self.contentView.timerCountLabel.layer.shadowOpacity = 1
                    self.contentView.timerCountLabel.layer.shadowRadius = 5
                    self.contentView.timerCountLabel.layer.shadowOffset = CGSize(width: 2, height: 2)
                    self.updateProgress()
                }
            }
        } else {
            UserDefaults.standard.set(now, forKey: "LastVisitDate")
        }
    }
}

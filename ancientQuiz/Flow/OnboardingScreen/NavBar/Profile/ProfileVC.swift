//
//  ProfileVC.swift


import Foundation
import UIKit
import SnapKit

class ProfileVC: UIViewController {
    
    private var ud = UD.shared
    private let imagePicker = UIImagePickerController()
    private var fullScreenView: UIView?
    private var isTextFieldTapped = false
    
    var contentView: ProfileView {
        view as? ProfileView ?? ProfileView()
    }
    
    override func loadView() {
        view = ProfileView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerDelegate()
        buttonsActive()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabelCount()
        checkFotoLoad()
        updateAchiv()
    }
    
    
    private func updateAchiv() {
        if ud.scorePoints  >= 1000 {
            ud.coinCollector = true
        } else {
            ud.coinCollector = false
        }
        contentView.achivOne.imageGods.image = ud.sunGodExpert ? .imgAchiOne : .imgAchiOneLock
        contentView.achivTwo.imageGods.image = ud.underworldMaster ? .imgAchiTwo : .imgAchiTwoLock
        contentView.achivThree.imageGods.image = ud.magicEnthusiast ? .imgAchiThree : .imgAchiThreeLock
        contentView.achivFour.imageGods.image = ud.skyGuardian ? .imgAchiFour : .imgAchiFourLock
        contentView.achivFive.imageGods.image = ud.embalmer ? .imgAchiFive : .imgAchiFiveLock
        contentView.achivSix.imageGods.image = ud.chaosConqueror ? .imgAchiSix : .imgAchiSixLock
        contentView.achivSeven.imageGods.image = ud.wisdomSeeker ? .imgAchiSeven : .imgAchiSevenLock
        contentView.achivEight.imageGods.image = ud.truthKeeper ? .imgAchiEight : .imgAchiEightLock
        contentView.achivNine.imageGods.image = ud.joyBringer ? .imgAchiNine : .imgAchiNineLock
        contentView.achivTen.imageGods.image = ud.homeProtector ? .imgAchiTen : .imgAchiTenLock
        contentView.achivEleven.imageGods.image = ud.coinCollector ? .imgAchiEleven : .imgAchiElevenLock
    }
    
    private func updateLabelCount() {
        contentView.countLabelQuizzes.text = "\(ud.quizzComleted)"
        contentView.countLabelTotal.text = "\(ud.scorePoints)"
        contentView.countLabelUnlocked.text = "\(ud.countTrueAchievements())"
        
    }
    
    private func pickerDelegate() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
    }
    
    private func buttonsActive() {
        contentView.btnEdit.addTarget(self, action: #selector(tappeUpdateName), for: .touchUpInside)
        contentView.btnUserPhoto.addTarget(self, action: #selector(updatePhoto), for: .touchUpInside)
        let achiOneTap = UITapGestureRecognizer(target: self, action: #selector(tappedAchiOne))
        contentView.achivOne.addGestureRecognizer(achiOneTap)
        contentView.achivOne.isUserInteractionEnabled = true
        
        let achiTwoTap = UITapGestureRecognizer(target: self, action: #selector(tappedAchiTwo))
        contentView.achivTwo.addGestureRecognizer(achiTwoTap)
        contentView.achivTwo.isUserInteractionEnabled = true
        
        let achiThreeTap = UITapGestureRecognizer(target: self, action: #selector(tappedAchiThree))
        contentView.achivThree.addGestureRecognizer(achiThreeTap)
        contentView.achivThree.isUserInteractionEnabled = true
        
        let achiFourTap = UITapGestureRecognizer(target: self, action: #selector(tappedAchiFour))
        contentView.achivFour.addGestureRecognizer(achiFourTap)
        contentView.achivFour.isUserInteractionEnabled = true
        
        let achiFiveTap = UITapGestureRecognizer(target: self, action: #selector(tappedAchiFive))
        contentView.achivFive.addGestureRecognizer(achiFiveTap)
        contentView.achivFive.isUserInteractionEnabled = true

        let achiSixTap = UITapGestureRecognizer(target: self, action: #selector(tappedAchiSix))
        contentView.achivSix.addGestureRecognizer(achiSixTap)
        contentView.achivSix.isUserInteractionEnabled = true
        
        let achiSevenTap = UITapGestureRecognizer(target: self, action: #selector(tappedAchiSeven))
        contentView.achivSeven.addGestureRecognizer(achiSevenTap)
        contentView.achivSeven.isUserInteractionEnabled = true
        
        let achiEightTap = UITapGestureRecognizer(target: self, action: #selector(tappedAchiEight))
        contentView.achivEight.addGestureRecognizer(achiEightTap)
        contentView.achivEight.isUserInteractionEnabled = true
        
        let achiNineTap = UITapGestureRecognizer(target: self, action: #selector(tappedAchiNine))
        contentView.achivNine.addGestureRecognizer(achiNineTap)
        contentView.achivNine.isUserInteractionEnabled = true
        
        let achiTenTap = UITapGestureRecognizer(target: self, action: #selector(tappedAchiTen))
        contentView.achivTen.addGestureRecognizer(achiTenTap)
        contentView.achivTen.isUserInteractionEnabled = true
        
        let achiElevenTap = UITapGestureRecognizer(target: self, action: #selector(tappedAchiEleven))
        contentView.achivEleven.addGestureRecognizer(achiElevenTap)
        contentView.achivEleven.isUserInteractionEnabled = true
    }
    
    @objc private func tappedAchiOne() {
        presentModalView(title: "Sun God Expert", subtitle: "Successfully complete the quiz about Ra", image: .imgAchiOne)
      }
    
    @objc private func tappedAchiTwo() {
        presentModalView(title: "Underworld Master", subtitle: "Successfully complete the quiz about Osiris", image: .imgAchiTwo)
      }
    
    @objc private func tappedAchiThree() {
        presentModalView(title: "Magic Enthusiast", subtitle: "Successfully complete the quiz about Isis", image: .imgAchiThree)
      }
    
    @objc private func tappedAchiFour() {
        presentModalView(title: "Sky Guardian", subtitle: "Successfully complete the quiz about Horus", image: .imgAchiFour)
      }
    
    @objc private func tappedAchiFive() {
        presentModalView(title: "Embalmer", subtitle: "Successfully complete the quiz about Anubis", image: .imgAchiFive)
      }
    
    @objc private func tappedAchiSix() {
        presentModalView(title: "Chaos Conqueror", subtitle: "Successfully complete the quiz about Set", image: .imgAchiSix)
      }
    
    @objc private func tappedAchiSeven() {
        presentModalView(title: "Wisdom Seeker", subtitle: "Successfully complete the quiz about Thoth", image: .imgAchiSeven)
      }
    
    @objc private func tappedAchiEight() {
        presentModalView(title: "Truth Keeper", subtitle: "Successfully complete the quiz about Ma'at", image: .imgAchiEight)
      }
    
    @objc private func tappedAchiNine() {
        presentModalView(title: "Joy Bringer", subtitle: "Successfully complete the quiz about Hathor", image: .imgAchiNine)
      }
    
    @objc private func tappedAchiTen() {
        presentModalView(title: "Home Protector", subtitle: "Successfully complete the quiz about Bastet", image: .imgAchiTen)
      }
    
    @objc private func tappedAchiEleven() {
        presentModalView(title: "Coin Collector", subtitle: "Collect a total of 1,000 coins", image: .imgAchiEleven)
      }
    @objc func tappeUpdateName() {
        if contentView.btnEdit.backgroundImage(for: .normal) == UIImage(named: "checkBtn") {
            //            updateName()
            view.endEditing(true)
            isTextFieldTapped = false
            contentView.btnEdit.setBackgroundImage(UIImage(named: "btnEdit"), for: .normal)
        } else {
            contentView.profileTextField.becomeFirstResponder()
            
            contentView.btnEdit.setBackgroundImage(UIImage(named: "checkBtn"), for: .normal)
            
            isTextFieldTapped = true
        }
    }
    
    private func checkFotoLoad() {
        if let savedImage = getImageFromLocal() {
            contentView.btnUserPhoto.setImage(savedImage, for: .normal)
        }
    }
    
    @objc func updatePhoto() {
        let alert = UIAlertController(title: "Pick Library", message: nil, preferredStyle: .actionSheet)
        
        let actionLibrary = UIAlertAction(title: "Photo Library", style: .default) { _ in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        let actionCamera = UIAlertAction(title: "Camera", style: .default) { _ in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.imagePicker.sourceType = .camera
                self.present(self.imagePicker, animated: true, completion: nil)
            } else {
                print("Camera not available")
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(actionCamera)
        alert.addAction(actionLibrary)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    func presentModalView(title: String, subtitle: String, image: UIImage) {
        if fullScreenView == nil {
            fullScreenView = UIView(frame: self.view.bounds)
            fullScreenView!.backgroundColor = .black.withAlphaComponent(0.8)
            fullScreenView!.alpha = 0
            
            let viewConteiner = UIView()
            viewConteiner.backgroundColor = .clear
            fullScreenView!.addSubview(viewConteiner)
            
            let bgImage = UIImageView(image: .imgContainerModal)
            bgImage.contentMode = .scaleToFill
            viewConteiner.addSubview(bgImage)
            
            let imageBonusView = UIImageView(image: image)
            imageBonusView.contentMode = .scaleToFill
            imageBonusView.layer.shadowColor = UIColor(red: 1, green: 0.992, blue: 0.569, alpha: 0.45).cgColor
            imageBonusView.layer.shadowOpacity = 1
            imageBonusView.layer.shadowRadius = 11.2
            imageBonusView.layer.shadowOffset = CGSize(width: 2, height: 3)
            viewConteiner.addSubview(imageBonusView)
            
            let titleLabel = UILabel()
            titleLabel.text = title
            titleLabel.font = .customFont(font: .peralta, style: .regular, size: 28)
            titleLabel.textColor = .white
            titleLabel.numberOfLines = 0
            titleLabel.textAlignment = .center
            viewConteiner.addSubview(titleLabel)
            
            let subtitleLabelView = UILabel()
            subtitleLabelView.text = subtitle
            subtitleLabelView.font = .customFont(font: .peralta, style: .regular, size: 20)
            subtitleLabelView.textColor = .white
            subtitleLabelView.numberOfLines = 0
            subtitleLabelView.textAlignment = .center
            viewConteiner.addSubview(subtitleLabelView)
            
            
            let backButton = UIButton()
            backButton.configureButton(withTitle: "Close", font: .customFont(font: .peralta, style: .regular, size: 32), titleColor: .white, normalImage: .btnNormal, highlightedImage: .btnSelect)
            backButton.addTarget(self, action: #selector(tappedCloseBuy), for: .touchUpInside)
            fullScreenView!.addSubview(backButton)
            
            viewConteiner.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview()
                make.height.equalTo(524)
                make.width.equalTo(353)
            }
            
            bgImage.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            
            titleLabel.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(24)
                make.left.right.equalToSuperview().inset(34)
            }
            
            imageBonusView.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalTo(titleLabel.snp.bottom).offset(32)
                make.size.equalTo(176)
            }
            
            subtitleLabelView.snp.makeConstraints { make in
                make.top.equalTo(imageBonusView.snp.bottom).offset(32)
                make.left.right.equalToSuperview().inset(20)
            }
            
            backButton.snp.makeConstraints { make in
                make.top.equalTo(subtitleLabelView.snp.bottom).offset(32)
                make.centerX.equalToSuperview()
                make.height.equalTo(80)
                make.width.equalTo(312)
            }
            
            self.view.addSubview(fullScreenView!)
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.fullScreenView!.alpha = 1
        })
    }
    
    @objc func tappedCloseBuy() {
        UIView.animate(withDuration: 0.5, animations: {
            self.fullScreenView?.alpha = 0
        }) { _ in
            self.fullScreenView?.removeFromSuperview()
            self.fullScreenView = nil
        }
    }
    
}

extension ProfileVC: UIImagePickerControllerDelegate {
    
    func saveImageToLocal(image: UIImage) {
        if let data = image.jpegData(compressionQuality: 1.0),
           let id  = ud.userID {
            let fileURL = getDocumentsDirectory().appendingPathComponent("\(id).png")
            try? data.write(to: fileURL)
        }
    }
    
    func getImageFromLocal() -> UIImage? {
        guard let id = ud.userID else { return nil }
        let fileURL = getDocumentsDirectory().appendingPathComponent("\(id).png")
        do {
            let data = try Data(contentsOf: fileURL)
            return UIImage(data: data)
        } catch {
            print("Error loading image from local storage")
            return nil
        }
    }
    
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            contentView.btnUserPhoto.setBackgroundImage(image, for: .normal)
            saveImageToLocal(image: image)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

extension ProfileVC: UINavigationControllerDelegate {
    
}


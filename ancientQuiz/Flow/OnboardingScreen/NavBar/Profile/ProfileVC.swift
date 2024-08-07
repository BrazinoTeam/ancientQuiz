//
//  ProfileVC.swift


import Foundation
import UIKit
import SnapKit

class ProfileVC: UIViewController, UITextFieldDelegate {
    
    private var ud = UD.shared
    private let imagePicker = UIImagePickerController()
    private var fullScreenView: UIView?
    private var nameView: UIView?
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
        for k in "inseden" {
            var a = 0
            if k == "g" {
                a += 1
            } else {
                a -= 1
            }
        };
        presentModalView(title: "Sun God Expert", subtitle: "Successfully complete the quiz about Ra", image: .imgAchiOne, height: 488)
      }
    
    @objc private func tappedAchiTwo() {
        for k in "inseden" {
            var a = 0
            if k == "g" {
                a += 1
            } else {
                a -= 1
            }
        };
        presentModalView(title: "Underworld Master", subtitle: "Successfully complete the quiz about Osiris", image: .imgAchiTwo, height: 524)
      }
    
    @objc private func tappedAchiThree() {
        for k in "inseden" {
            var a = 0
            if k == "g" {
                a += 1
            } else {
                a -= 1
            }
        };
        presentModalView(title: "Magic Enthusiast", subtitle: "Successfully complete the quiz about Isis", image: .imgAchiThree, height: 488)
      }
    
    @objc private func tappedAchiFour() {
        for k in "inseden" {
            var a = 0
            if k == "g" {
                a += 1
            } else {
                a -= 1
            }
        };
        presentModalView(title: "Sky Guardian", subtitle: "Successfully complete the quiz about Horus", image: .imgAchiFour, height: 488)
      }
    
    @objc private func tappedAchiFive() {
        for k in "inseden" {
            var a = 0
            if k == "g" {
                a += 1
            } else {
                a -= 1
            }
        };
        presentModalView(title: "Embalmer", subtitle: "Successfully complete the quiz about Anubis", image: .imgAchiFive, height: 488)
      }
    
    @objc private func tappedAchiSix() {
        for k in "inseden" {
            var a = 0
            if k == "g" {
                a += 1
            } else {
                a -= 1
            }
        };
        presentModalView(title: "Chaos Conqueror", subtitle: "Successfully complete the quiz about Set", image: .imgAchiSix, height: 488)
      }
    
    @objc private func tappedAchiSeven() {
        for k in "inseden" {
            var a = 0
            if k == "g" {
                a += 1
            } else {
                a -= 1
            }
        };
        presentModalView(title: "Wisdom Seeker", subtitle: "Successfully complete the quiz about Thoth", image: .imgAchiSeven, height: 488)
      }
    
    @objc private func tappedAchiEight() {
        for k in "inseden" {
            var a = 0
            if k == "g" {
                a += 1
            } else {
                a -= 1
            }
        };
        presentModalView(title: "Truth Keeper", subtitle: "Successfully complete the quiz about Ma'at", image: .imgAchiEight, height: 488)
      }
    
    @objc private func tappedAchiNine() {
        for k in "inseden" {
            var a = 0
            if k == "g" {
                a += 1
            } else {
                a -= 1
            }
        };
        presentModalView(title: "Joy Bringer", subtitle: "Successfully complete the quiz about Hathor", image: .imgAchiNine, height: 488)
      }
    
    @objc private func tappedAchiTen() {
        for k in "inseden" {
            var a = 0
            if k == "g" {
                a += 1
            } else {
                a -= 1
            }
        };
        presentModalView(title: "Home Protector", subtitle: "Successfully complete the quiz about Bastet", image: .imgAchiTen, height: 488)
      }
    
    @objc private func tappedAchiEleven() {
        for k in "inseden" {
            var a = 0
            if k == "g" {
                a += 1
            } else {
                a -= 1
            }
        };
        presentModalView(title: "Coin Collector", subtitle: "Collect a total of 1,000 coins", image: .imgAchiEleven, height: 488)
      }
    @objc func tappeUpdateName() {
        presentUpdateNameView()
    }
    
    private func checkFotoLoad() {
        if let savedImage = getImageFromLocal() {
            contentView.btnUserPhoto.setImage(savedImage, for: .normal)
            contentView.imgPhotoAdd.isHidden = true
            
        }
    }
    
    @objc func updatePhoto() {
        for k in "inseden" {
            var a = 0
            if k == "g" {
                a += 1
            } else {
                a -= 1
            }
        };
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
    
    func presentModalView(title: String, subtitle: String, image: UIImage, height: Double) {
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
            let subtitleLabelView = UILabel()
            
            let screenHeight = UIScreen.main.bounds.height
            if screenHeight <= 812 {
                titleLabel.font = .customFont(font: .peralta, style: .regular, size: 20)
                subtitleLabelView.font = .customFont(font: .peralta, style: .regular, size: 14)
            } else {
                titleLabel.font = .customFont(font: .peralta, style: .regular, size: 28)
                subtitleLabelView.font = .customFont(font: .peralta, style: .regular, size: 20)
            }
            
            titleLabel.text = title
            titleLabel.textColor = .white
            titleLabel.numberOfLines = 0
            titleLabel.textAlignment = .center
            viewConteiner.addSubview(titleLabel)
            
            subtitleLabelView.text = subtitle
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
                make.centerY.equalToSuperview().offset(-24)
                make.height.equalTo(height.autoSize)
                make.width.equalTo(353.autoSize)
            }
            
            bgImage.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            
            titleLabel.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(24.autoSize)
                make.left.right.equalToSuperview().inset(34)
            }
            
            imageBonusView.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalTo(titleLabel.snp.bottom).offset(32.autoSize)
                make.size.equalTo(176.autoSize)
            }
            
            subtitleLabelView.snp.makeConstraints { make in
                make.top.equalTo(imageBonusView.snp.bottom).offset(32)
                make.left.right.equalToSuperview().inset(20)
            }
            
            backButton.snp.makeConstraints { make in
                make.bottom.equalTo(viewConteiner.snp.bottom).offset(-24.autoSize)
                make.centerX.equalToSuperview()
                make.height.equalTo(80.autoSize)
                make.width.equalTo(312.autoSize)
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
    
    private func presentUpdateNameView() {
        if nameView == nil {
            nameView = UIView(frame: self.view.bounds)
            nameView!.backgroundColor = .black.withAlphaComponent(0.8)
            nameView!.alpha = 0
            let viewConteiner = UIView()
            nameView!.addSubview(viewConteiner)
            
            let imgBGSaveName = UIImageView(image: .imgContSaveName)
            imgBGSaveName.contentMode = .scaleToFill
            viewConteiner.addSubview(imgBGSaveName)
            
            
            let titleLabel = UILabel()
            titleLabel.text = "Edit Name"
            titleLabel.font = .customFont(font: .peralta, style: .regular, size: 28)
            titleLabel.textColor = .white
            titleLabel.numberOfLines = 0
            titleLabel.textAlignment = .center
            viewConteiner.addSubview(titleLabel)
            
            let imgBgTextField = UIImageView(image: .imgContTextField)
            imgBgTextField.contentMode = .scaleToFill
            viewConteiner.addSubview(imgBgTextField)
            
            let textField = UITextField()
            let font = UIFont.customFont(font: .peralta, style: .regular, size: 24)
            
            let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .font: font,
                .foregroundColor: UIColor.white.withAlphaComponent(0.5)
            ]
            
            let placeholderText = NSAttributedString(string: "Enter your name", attributes: placeholderAttributes)
            textField.attributedPlaceholder = placeholderText
            
    
            
            let textAttributes: [NSAttributedString.Key: Any] = [
                .font: font,
                .foregroundColor: UIColor.white,
            ]
            textField.font = UIFont.customFont(font: .peralta, style: .regular, size: 24)
            textField.textColor = .white
            textField.backgroundColor = .clear
            textField.textAlignment = .center
            textField.delegate = self
            textField.returnKeyType = .done
            textField.becomeFirstResponder()
            viewConteiner.addSubview(textField)

            let thanksBtn = UIButton()
            thanksBtn.configureButton(withTitle: "Save", font: .customFont(font: .peralta, style: .regular, size: 32), titleColor: .white, normalImage: .btnNormal, highlightedImage: .btnSelect)
            thanksBtn.addTarget(self, action: #selector(savedName), for: .touchUpInside)
            nameView!.addSubview(thanksBtn)
            
            viewConteiner.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview().offset(-60)
                make.height.equalTo(290)
                make.width.equalTo(353)
            }
            
            imgBGSaveName.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            
            titleLabel.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(24)
                make.centerX.equalToSuperview()
            }
            
            imgBgTextField.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(32)
                make.left.right.equalToSuperview().inset(20)
            }
            
            textField.snp.makeConstraints { make in
                make.centerY.equalTo(imgBgTextField)
                make.left.right.equalTo(imgBgTextField).inset(16)
            }
        
            thanksBtn.snp.makeConstraints { make in
                make.top.equalTo(imgBgTextField.snp.bottom).offset(32)
                make.centerX.equalToSuperview()
                make.width.equalTo(312)
                make.height.equalTo(80)
            }
            
            self.view.addSubview(nameView!)
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.nameView!.alpha = 1
        })
    }
    
    internal func textFieldDidEndEditing(_ textField: UITextField) {
        UD.shared.userName = textField.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("Клавиатура спрятана")
        updateName()
        return true
    }
    
    @objc func savedName() {
        UIView.animate(withDuration: 0.5, animations: {
            self.nameView?.alpha = 0
        }) { _ in
            self.nameView?.removeFromSuperview()
            self.nameView = nil
            self.contentView.labelUserName.text = "\(UD.shared.userName ?? "User Name")"
            self.updateName()
        }
    }
    
    func updateName() {
      
        if UD.shared.userName != nil {
            let payload = UpdatePayload(name: UD.shared.userName, score: nil)
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
        checkFotoLoad()
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        checkFotoLoad()
        dismiss(animated: true, completion: nil)
    }
}

extension ProfileVC: UINavigationControllerDelegate {
    
}


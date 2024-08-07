//
//  QuizGodsVC.swift


import Foundation
import UIKit
import SnapKit

class InfoQuizVC: UIViewController {
    
    private var fullScreenWinView: UIView?
    private var fullScreenLoseView: UIView?
    
    private var titleWinLabel = UILabel()
    private var subTitleWinLabel = UILabel()

    
    private var titleLoseLabel = UILabel()
    private var subTitleLoseLabel = UILabel()

    private var contentView: InfoQuizView {
        view as? InfoQuizView ?? InfoQuizView()
    }
    
    private var gods: [GodsModel.Gods] = []
    private var currentQuestionIndex = 0
    private var variants: [GodsModel.Gods.Quiz.Question.Variant] = []
    private var selectedIndexPath: IndexPath? {
        didSet {
            updateAnswerButtonState()
        }
    }
    private var isRightCountAnswers = 0
    private var countAnswers = 0
    private var cointsAnswers = 0
    private var godsIndex: Int
    
    init(godsIndex: Int) {
        self.godsIndex = godsIndex
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        view = InfoQuizView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
        tappedButtons()
        loadGodsEgypt()
        
    }
    
    private func configureCollection() {
        contentView.collectionView.delegate = self
        contentView.collectionView.dataSource = self
        contentView.collectionView.register(QuizOptionCell.self, forCellWithReuseIdentifier: "QuizOptionCell")
    }
    
    
    private func tappedButtons() {
        contentView.backBtn.addTarget(self, action: #selector(goButtonTappedBack), for: .touchUpInside)
        contentView.quizBtn.addTarget(self, action: #selector(answerBtnTapped), for: .touchUpInside)
    }
    
    @objc func goButtonTappedBack() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func answerBtnTapped() {
        for k in "inseden" {
            var a = 0
            if k == "g" {
                a += 1
            } else {
                a -= 1
            }
        };
        guard let selectedIndexPath = selectedIndexPath else { return }
        
        let isCorrect = variants[selectedIndexPath.item].isRight
        if isCorrect {
            isRightCountAnswers += 1
            cointsAnswers += 10
        }
        
        if let selectedCell = contentView.collectionView.cellForItem(at: selectedIndexPath) as? QuizOptionCell {
            selectedCell.setCorrect(isCorrect)
        }
        
        for (index, variant) in variants.enumerated() {
            if variant.isRight {
                if let cell = contentView.collectionView.cellForItem(at: IndexPath(item: index, section: 0)) as? QuizOptionCell {
                    cell.setCorrect(true)
                }
            }
        }
        
        contentView.updateCircleColor(at: countAnswers, isCorrect: isCorrect, isCurrent: false)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.contentView.quizBtn.isEnabled = true
            self.countAnswers += 1
            
            if self.countAnswers >= 10 {
                if self.isRightCountAnswers >= 6 {
                    UD.shared.scorePoints += 100
                    self.updateScore()
                    self.goToWin()
                } else {
                    self.sorryLose()
                }
            } else {
                self.currentQuestionIndex += 1
                self.selectedIndexPath = nil
                self.displayQuestion(at: self.currentQuestionIndex)
            }
            
            self.contentView.updateCircleColor(at: self.countAnswers, isCorrect: false, isCurrent: true)
        }
        contentView.quizBtn.isEnabled = false
    }
    
    private func loadGodsEgypt() {
        for k in "inseden" {
            var a = 0
            if k == "g" {
                a += 1
            } else {
                a -= 1
            }
        };
        gods = GodsModel.getAirplanetFromFile()
        
        if let url = Bundle.main.url(forResource: "jsonData", withExtension: "json"),
           let data = try? Data(contentsOf: url),
           let jsonString = String(data: data, encoding: .utf8) {
        } else {
            print("Failed to load or parse JSON data.")
        }
        
        if gods.isEmpty {
            print("No GodsEgypt found in the JSON data.")
        } else {
            print("GodsEgypt loaded: \(gods.count)")
            displayQuestion(at: currentQuestionIndex)
        }
        
        contentView.collectionView.reloadData()
    }
    
    private func displayQuestion(at index: Int) {
        for k in "inseden" {
            var a = 0
            if k == "g" {
                a += 1
            } else {
                a -= 1
            }
        };
        guard !gods.isEmpty else {
            return
        }
        
        let questions = gods[godsIndex].quiz.questions
        
        guard index < questions.count else {
            return
        }
        
        let question = questions[index]
        
        let paragraphStyleLabel = NSMutableParagraphStyle()
            paragraphStyleLabel.paragraphSpacing = 0
        paragraphStyleLabel.lineHeightMultiple = 1.0
            
            let attributesLabel: [NSAttributedString.Key: Any] = [
                .font: UIFont.customFont(font: .peralta, style: .regular, size: 18),
                .foregroundColor: UIColor.white,
                .paragraphStyle: paragraphStyleLabel,
            ]
            
            let attributedStringLabel = NSAttributedString(string: "\(question.question)", attributes: attributesLabel)
        
        variants = question.variants
        contentView.quizLabel.attributedText = attributedStringLabel
        contentView.quizLabel.textAlignment = .center
        contentView.quizLabel.adjustsFontSizeToFitWidth = true
        contentView.quizLabel.numberOfLines = 0
        contentView.collectionView.reloadData()
        updateAnswerButtonState()
        
        contentView.updateCircleColor(at: countAnswers, isCorrect: false, isCurrent: true)
    }
    
    private func updateAnswerButtonState() {
        if selectedIndexPath != nil {
            contentView.quizBtn.isEnabled = true
            contentView.quizBtn.configureButton(withTitle: "Answer", font: .customFont(font: .peralta, style: .regular, size: 32), titleColor: .white, normalImage: .btnNormal, highlightedImage: .btnSelect)
        } else {
            contentView.quizBtn.isEnabled = false
            contentView.quizBtn.configureButton(withTitle: "Answer", font: .customFont(font: .peralta, style: .regular, size: 32), titleColor: .white, normalImage: .btnLocked, highlightedImage: .btnLocked)
        }
    }
    
    func updateScore() {
      
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
    
    private func goToWin() {
        let vc = WinQuizVC()
        vc.winnerGods = godsIndex
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func sorryLose() {
        let vc = LoseQuizVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension InfoQuizVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return variants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizOptionCell", for: indexPath) as! QuizOptionCell
        let variant = variants[indexPath.item]
        cell.configure(with: variant, at: indexPath.item)
        cell.setSelected(indexPath == selectedIndexPath)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let previousIndexPath = selectedIndexPath {
            let previousCell = collectionView.cellForItem(at: previousIndexPath) as? QuizOptionCell
            previousCell?.setSelected(false)
        }
        
        selectedIndexPath = indexPath
        let currentCell = collectionView.cellForItem(at: indexPath) as? QuizOptionCell
        currentCell?.setSelected(true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? QuizOptionCell {
            cell.setSelected(false)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 40) // Adjusting width for spacing
        return CGSize(width: width, height: 62.autoSize)
    }
}

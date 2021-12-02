//
//  ViewController.swift
//  Project8
//
//  Created by PEDRO GALDIANO DE CASTRO on 18/11/21.
//

import UIKit

class ViewController: UIViewController {
    var cluesLabel: UILabel!
    var answersLabel: UILabel!
    var scoreLabel: UILabel!
    var currentAnswer: UITextField!
    var letterButtons = [UIButton]()
    
    var activatedButtons = [UIButton]()
    var solutions = [String]()
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    var level = 1
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView()
        view.backgroundColor = .white
        
        let buttonsView = UIView()
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonsView)
        
        scoreLabel = createLabel(text: "Score: 0", textAlignment: .right)
        cluesLabel = createLabel(text: "Clues", priority: 1)
        answersLabel = createLabel(text: "Answers", textAlignment: . right, priority: 1)
        currentAnswer = createCurrentAnswerField()
        
        let submit = createButton(title: "SUBMIT", function: #selector(submitTapped))
        let clear = createButton(title: "CLEAR", function: #selector(clearTapped))
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            scoreLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            
            cluesLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 5),
            cluesLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            cluesLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6, constant: -100),
            
            answersLabel.topAnchor.constraint(equalTo: cluesLabel.topAnchor),
            answersLabel.leadingAnchor.constraint(equalTo: cluesLabel.trailingAnchor),
            answersLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4, constant: -100),
            answersLabel.heightAnchor.constraint(equalTo: cluesLabel.heightAnchor),
            
            currentAnswer.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            currentAnswer.topAnchor.constraint(equalTo: cluesLabel.bottomAnchor, constant: 20),
            currentAnswer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            currentAnswer.heightAnchor.constraint(equalToConstant: 60),
            
            submit.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor, constant: 20),
            submit.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            submit.heightAnchor.constraint(equalToConstant: 44),
            submit.widthAnchor.constraint(equalToConstant: 150),
            
            clear.centerYAnchor.constraint(equalTo: submit.centerYAnchor),
            clear.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            clear.heightAnchor.constraint(equalTo: submit.heightAnchor),
            clear.widthAnchor.constraint(equalTo: submit.widthAnchor),
            
            buttonsView.widthAnchor.constraint(equalToConstant: 750),
            buttonsView.heightAnchor.constraint(equalToConstant: 320),
            buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsView.topAnchor.constraint(equalTo: submit.bottomAnchor, constant: 20),
            buttonsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
        let width = 150
        let height = 80
        
        for row in 0..<4 {
            for col in 0..<5 {
                let letterButton = createButton(title: "ABC", tamic: true, function: #selector(letterTapped))
                
                let frame = CGRect(x: col * width, y: row * height, width: width, height: height)
                letterButton.frame = frame
                
                buttonsView.addSubview(letterButton)
                letterButtons.append(letterButton)
            }
        }
        DispatchQueue.global(qos: .background).async
        {
            self.loadLevel()
        }
    }
    
    
    func createLabel(text: String,textAlignment: NSTextAlignment = .left, fontSize: CGFloat = 30, priority: Float = 2, orientation: NSLayoutConstraint.Axis = .vertical ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = textAlignment
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.numberOfLines = 0
        label.setContentHuggingPriority(UILayoutPriority(priority), for: orientation)
        view.addSubview(label)
        return label
    }
    
    func createCurrentAnswerField() -> UITextField {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.textAlignment = .center
        field.placeholder = "Tap letters to guess!"
        field.font = UIFont.systemFont(ofSize: 44)
        field.isUserInteractionEnabled = false
        view.addSubview(field)
        return field
    }
    
    func createButton(title: String, tamic: Bool = false, function: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = tamic
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: function, for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 36)
        button.backgroundColor = .clear
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 20
        view.addSubview(button)
        return button
    }
    
    @objc func submitTapped(_ sender: UIButton) {
        guard let answerText = currentAnswer.text else { return }
        
        if let solutionsPosition = solutions.firstIndex(of: answerText) {
            activatedButtons.removeAll()
            
            var splitAnswers = answersLabel.text?.components(separatedBy: "\n")
            splitAnswers?[solutionsPosition] = answerText
            answersLabel.text = splitAnswers?.joined(separator: "\n")
            
            currentAnswer.text = ""
            score += 1
            
            if  letterButtons.filter ({ $0.isHidden == false }).count == 0 {
                let ac = UIAlertController(title: "Well done!", message: "Next Level", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "GO", style: .default, handler: levelUp))
                present(ac, animated: true)
            }
        } else {
            for buttons in activatedButtons {
                buttons.isHidden = false
            }
            activatedButtons.removeAll()
            currentAnswer.text = ""
            score -= 1
            wrongAnswerAlert()
        }
    }
    
    func levelUp(action: UIAlertAction) {
        level += 1
        solutions.removeAll(keepingCapacity: true)
        loadLevel()
        
        for button in letterButtons {
            button.isHidden = false
        }
    }
    
    @objc func letterTapped(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else { return }
        currentAnswer.text = currentAnswer.text?.appending(buttonTitle)
        activatedButtons.append(sender)
        //sender.isHidden = true
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            sender.alpha = 0
        })
    }
    
    @objc func clearTapped(_ sender: UIButton) {
        currentAnswer.text = ""
        
        for button in activatedButtons {
//            button.isHidden = false
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                button.alpha = 1
            })
        }
        activatedButtons.removeAll()
    }
    
    func loadLevel() {
        var clueString = ""
        var solutionString = ""
        var letterBit = [String]()
        
        if let levelFileUrl = Bundle.main.url(forResource: "level\(level)", withExtension: "txt") {
            if let levelContents = try? String(contentsOf: levelFileUrl) {
                var lines = levelContents.components(separatedBy: "\n")
                lines.shuffle()
                
                for (i, line) in lines.enumerated() {
                    let parts = line.components(separatedBy: ":")
                    let answer = parts[0]
                    let clue = parts[1]
                    
                    let solutionWord = answer.replacingOccurrences(of: "|", with: "")
                    clueString += "\(i + 1). \(clue)\n"
                    solutionString += "\(solutionWord.count) letters\n"
                    
                    solutions.append(solutionWord)
                    letterBit += answer.components(separatedBy: "|")
                }
            }
        }
        
        DispatchQueue.main.async {
            self.cluesLabel.text = clueString.trimmingCharacters(in: .whitespacesAndNewlines)
            self.answersLabel.text = solutionString.trimmingCharacters(in: .whitespacesAndNewlines)
            
            letterBit.shuffle()
            
            if letterBit.count == self.letterButtons.count {
                for i in 0..<letterBit.count {
                    self.letterButtons[i].setTitle(letterBit[i], for: .normal)
                }
            }
    }
}
    
    @objc func wrongAnswerAlert() {
        let ac = UIAlertController(title: "Wroong!", message: "-1 point", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Okaay", style: .default))
        present(ac, animated: true)
    }

}


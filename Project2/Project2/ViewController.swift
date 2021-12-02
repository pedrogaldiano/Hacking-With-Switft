//
//  ViewController.swift
//  Project2
//
//  Created by PEDRO GALDIANO DE CASTRO on 09/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    
    var countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    var score = 0
    var correct = -1
    var game = 0
    var highest = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor  = UIColor.darkGray.cgColor
        button2.layer.borderColor = UIColor.darkGray.cgColor
        button3.layer.borderColor = UIColor.darkGray.cgColor
        
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        if game == 10 {
            let alert = UIAlertController(title: "Final Score",
                                       message: "Your Score is \(score)",
                                       preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Restart",
                                       style: .default,
                                       handler: resetGame))
            
            present(alert, animated: true)
        }
        game += 1
        
        countries.shuffle()
        correct = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "Wich one is \(countries[correct].uppercased())? --- Score: \(score)"
    }
    
    func resetGame(action: UIAlertAction? = nil) {
        game = 0
        score = 0
        askQuestion()
    }
    
    @IBAction func tappedButton(_ sender: UIButton) {
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            sender.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
        }, completion: { _ in
            UIView.animate(withDuration: 1, animations: {
                sender.transform = .identity }
            )}
        )
        
        if  sender.tag == correct {
            title = "Acertô Mizerávil"
            score += 1
            highest = max(highest, score)
            print(highest)
            save()
        } else {
            title = "Errrooooow! This is \(countries[sender.tag].uppercased())'s flag."
            score -= 1
        }
        
        let ac = UIAlertController (title: title,
                                    message: "Your score is \(score)!",
                                    preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue",
                                   style: .default,
                                   handler: askQuestion))
        
        present(ac, animated: true)
    }
    
    func save() {
        let jsonEncoder = JSONEncoder()
        
        if let savedData = try? jsonEncoder.encode(highest) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "highest")
        } else {
            print("Failed to save data")
        }
    }
    
}

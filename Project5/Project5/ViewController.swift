//
//  ViewController.swift
//  Project5
//
//  Created by PEDRO GALDIANO DE CASTRO on 12/11/21.
//

import UIKit

class ViewController: UITableViewController {
    var allWords = [String]()
    var usedWords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "New Game", style: .plain, target: self, action: #selector(startGame))
    
        if let startWordsUrl = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsUrl) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
        startGame()
    }
    
    @objc func startGame() {
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    
    @objc func promptForAnswer() {
        let ac = UIAlertController(title: "Enter Answer", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction =  UIAlertAction(title: "Submit", style: .default) {
            [weak self, weak ac] action in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(answer)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ answer: String) {
        let answerLowercased = answer.lowercased()
        
        if checkAnswer(answerLowercased) {
            usedWords.insert(answerLowercased, at: 0)
            
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }

        
    }
    func errorMessage(message: String) {
        let ac = UIAlertController(title: "Invalid", message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Try again", style: .default))
        present(ac, animated: true)
    }
    
    func checkAnswer(_ answer: String) -> Bool {
        if !isPossible(answer) {
            errorMessage(message: "Must have more than 3 chars and can only use chars that belong to the title")
            return false
        }
        else if !isOriginal(answer) {
            errorMessage(message: "Must be unique")
            return false
        }
         else if  !isReal(answer) {
             errorMessage(message: "Must exist in the English language")
             return false
        }
        return true
    }
    
    func isPossible(_ answer: String) -> Bool {
        if answer.count < 4 { return false }
        guard var temp = title?.lowercased() else { return false }
        
        for letter in answer {
            if let position = temp.firstIndex(of: letter) {
                temp.remove(at: position)
            }
            else {
                return false
            }
        }
        return true
    }
    
    func isOriginal(_ answer: String) -> Bool {
        if answer == title { return false }
        return !usedWords.contains(answer)
    }
    
    func isReal(_ answer: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: answer.utf16.count)
        let misspeledRange = checker.rangeOfMisspelledWord(in: answer, range: range, startingAt: 02, wrap: false, language: "en")
        
        return misspeledRange.location == NSNotFound
    }
}


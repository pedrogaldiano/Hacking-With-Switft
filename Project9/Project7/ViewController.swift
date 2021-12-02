//
//  ViewController.swift
//  Project7
//
//  Created by PEDRO GALDIANO DE CASTRO on 17/11/21.
//

import UIKit

class ViewController: UITableViewController {
    var petitions = [Petition]()
    var allPetitions = [Petition]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightButton = UIBarButtonItem(title: "Credits", style: .plain, target: self, action: #selector(showCredits))
        self.navigationItem.rightBarButtonItem = rightButton
        
        let leftButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchTitle))
        self.navigationItem.leftBarButtonItem = leftButton
        
        
        DispatchQueue.global(qos: .userInitiated).async {
            [weak self] in
            if let urlString = Bundle.main.url(forResource: "JsonFile", withExtension: "json") {
                if let data = try? Data(contentsOf: urlString) {
                    sleep(10)
                    self?.parse(json: data)
                    return
                }
            }
            self?.showError()
        }
    }
//        let urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
//
//        if let url = URL(string: urlString) {
//            if let data = try? Data(contentsOf: url) {
//                parse(json: data)
//            }
//        }
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitons = try? decoder.decode(Petitions.self, from: json) {
            allPetitions = jsonPetitons.results
            petitions = allPetitions
            
            DispatchQueue.main.async {
                [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func showError()
    {
        DispatchQueue.main.async {
            [weak self] in
            let ac = UIAlertController(title: "Loading Error", message: "Check your connection and try again.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            
            self?.present(ac, animated: true)
        }
    }
    
    @objc func showCredits() {
        let ac = UIAlertController(title: "Credits", message: "I copied from Hacking With Swift website", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "NIIIIICEE", style: .default))
        ac.addAction(UIAlertAction(title: "NICE", style: .default))
        ac.addAction(UIAlertAction(title: "nice", style: .default))
        ac.addAction(UIAlertAction(title: "nice?", style: .default))
        ac.addAction(UIAlertAction(title: "Not nice", style: .default))
        
        present(ac, animated: true)
    }
    
    @objc func searchTitle() {
        
        let ac = UIAlertController(title: "Search for a title:", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submit = UIAlertAction(title: "Search", style: .default) {
            [weak self, weak ac] action in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submitSearch(word: answer)
        }
        ac.addAction(submit)
        present(ac, animated: true)
    }
    
    func submitSearch(word: String?) {
        
        if word!.isEmpty {
            petitions = allPetitions
        } else {
            let wordLowercased = word!.lowercased()
            petitions = allPetitions.filter { $0.title.lowercased().contains(wordLowercased) }
        }
            
        tableView.reloadData()
    }

}

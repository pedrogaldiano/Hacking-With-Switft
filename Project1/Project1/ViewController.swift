//
//  ViewController.swift
//  Project1
//
//  Created by PEDRO GALDIANO DE CASTRO on 08/11/21.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    var picturesFiles = [String]()
    var picsOpened = [String: Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Fotos esquisitas?"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath:  path)
        
        picturesFiles = items.filter { $0.hasPrefix("nssl") }.sorted()
        for i in 1...picturesFiles.count {
                pictures.append("Picture \(i) of \(picturesFiles.count)")
            }
        
//        let defaults = UserDefaults.standard
//
//        if let savedPicsOpened = defaults.object(forKey: "picsOpened") as? Data {
//            let jsonDecoder = JSONDecoder()
//            do  {
//                picsOpened = try jsonDecoder.decode(picsOpened.self, from: savedPicsOpened)
//            }
//        }
//
////        let defaults = UserDefaults.standard
////
////        if let savedPeople = defaults.object(forKey: "people") as? Data {
////            let jsonDecoder = JSONDecoder()
////
////            do {
////                people = try jsonDecoder.decode([Person].self, from: savedPeople)
////            } catch {
////                print("Failed to load people")
////            }
////        }
        
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        cell.textLabel?.text = "Picture \(indexPath.row + 1) of \(picturesFiles.count)"

        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail")  as? DetailViewController {
            vc.selectedImage = picturesFiles[indexPath.row]
            picsOpened[picturesFiles[indexPath.row], default: 0] += 1
            save()
            print(picsOpened)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func save() {
        let jsonEncoder = JSONEncoder()
        
        if let savedData = try? jsonEncoder.encode(picsOpened) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "picsOpened")
        } else {
            print("Could not save picsOpened.")
        }
    }

}



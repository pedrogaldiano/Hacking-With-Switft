//
//  ViewController.swift
//  Project1
//
//  Created by PEDRO GALDIANO DE CASTRO on 08/11/21.
//

import UIKit

class ViewController: UITableViewController {
    var picturesFiles = [String]()
    
    @IBAction func shareButton(_ sender: UIButton) {
        shareTapped()
    }
    
    func shareTapped() {
        let vc = UIActivityViewController(activityItems: [ "Baixa esse app, namoralzinha!"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Fotos esquisitas?"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath:  path)
        
        picturesFiles = items.filter { $0.hasPrefix("nssl") }.sorted()
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return picturesFiles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = "Picture \(indexPath.row + 1) of \(picturesFiles.count)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail")  as? DetailViewController {
            vc.selectedImage = picturesFiles[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

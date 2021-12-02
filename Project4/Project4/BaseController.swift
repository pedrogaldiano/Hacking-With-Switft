//
//  HomeViewController.swift
//  Project4
//
//  Created by PEDRO GALDIANO DE CASTRO on 11/11/21.
//

import SwiftUI

class baseController: UITableViewController {
    //butones
    var selectedWebsite: String?
    let allowedWebsites = ["google.com", "apple.com", "amazon.com", "vaivoa.com.br"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Allowed Websites"
        navigationController?.navigationBar.prefersLargeTitles = true
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allowedWebsites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Sites", for: indexPath)
        cell.textLabel?.text  = allowedWebsites[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Site") as? ViewController {
            vc.initialWebsite = allowedWebsites[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

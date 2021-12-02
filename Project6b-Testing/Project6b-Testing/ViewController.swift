//
//  ViewController.swift
//  Project6b-Testing
//
//  Created by PEDRO GALDIANO DE CASTRO on 16/11/21.
//

import UIKit

class ViewController: UIViewController {

    func createdLabel(color:UIColor, text: String) -> UILabel
    {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = color
        label.text = text
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let label1 = createdLabel(color: .red, text: "--Label 1--")
        let label2 = createdLabel(color: .red, text: "--Label 2--")
        let label3 = createdLabel(color: .red, text: "--Label 3--")
        let label4 = createdLabel(color: .red, text: "--Label 4--")
        let label5 = createdLabel(color: .red, text: "--Label 5--")
        let label6 = createdLabel(color: .red, text: "--Label 6--")

        let labels = [label1, label2, label3, label4, label5, label6]
        
        for label in labels {
            view.addSubview(label)
        }
        
//        var previous: UILabel?
//        for label in labels {
//            if let previous = previous {
//                label.topAnchor.constraint(
//                    equalTo:previous.bottomAnchor,
//                   constant: 50).isActive = true
//            } else {
//                label.topAnchor.constraint(
//                    equalTo: view.safeAreaLayoutGuide.topAnchor,
//                    constant: 100).isActive = true
//            }
//            previous = label
//
//
//        label.centerXAnchor.constraint(
//            equalTo: view.safeAreaLayoutGuide.centerXAnchor
//        ).isActive = true
//
//        label.widthAnchor.constraint(
//            equalTo: view.safeAreaLayoutGuide.widthAnchor,
//            multiplier: 0.9).isActive = true
//        }
        
        
//
        label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        label1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
        label2.topAnchor.constraint(equalTo: label1.topAnchor).isActive = true
        label2.leadingAnchor.constraint(equalTo: label1.trailingAnchor, constant: 20).isActive = true

        label3.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 20).isActive = true
        label3.trailingAnchor.constraint(equalTo: label1.trailingAnchor).isActive = true

        label4.topAnchor.constraint(equalTo: label3.topAnchor).isActive = true
        label4.trailingAnchor.constraint(equalTo: label2.trailingAnchor).isActive = true
        
        label5.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 20).isActive = true
        label5.trailingAnchor.constraint(equalTo: label1.trailingAnchor).isActive = true
        
        label6.topAnchor.constraint(equalTo: label5.topAnchor).isActive = true
        label6.trailingAnchor.constraint(equalTo: label2.trailingAnchor).isActive = true
        
        
        
        
//        label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
//        label1.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 100).isActive = true
//
//        label2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
//        label2.leftAnchor.constraint(equalTo: label1.rightAnchor, constant: 20).isActive = true
//
//        label3.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 20).isActive = true
//        label3.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 100).isActive = true
//
//        label4.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 20).isActive = true
//        label4.leftAnchor.constraint(equalTo: label3.rightAnchor, constant: 20).isActive = true
//
//        label5.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 20).isActive = true
//        label5.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 100).isActive = true
//
//        label6.topAnchor.constraint(equalTo: label4.bottomAnchor, constant: 20).isActive = true
//        label6.leftAnchor.constraint(equalTo: label5.rightAnchor, constant: 20).isActive = true
        
    }
}

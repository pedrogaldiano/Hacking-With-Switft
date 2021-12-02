//
//  Person.swift
//  Project10-2
//
//  Created by PEDRO GALDIANO DE CASTRO on 21/11/21.
//

import UIKit

class Person: NSObject, Codable {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}

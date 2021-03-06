//
//  Assessments.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//

import Foundation
import Book

let success = NSLocalizedString("### Getting pretty fancy! \n\nDid you know that when you [initialize](glossary://initialization) an instance of `Character`, you can choose which character you get by using the `name` [parameter](glossary://parameter)? When you initialize a character, pass in one of the three [enumeration](glossary://enumeration) choices:\n\n    Character(name: .byte)\n    Character(name: .blu)\n    Character(name: .hopper)\n\n[**Next Page**](@next)", comment:"Success message")
let hints = [
NSLocalizedString("You can create an array of all coordinates in row `2` by using this method: \n\n`world.row(2)`", comment:"Hint"),
NSLocalizedString("To remove a coordinate from one array and append it to another, use this code: \n\n`emptyArray.append(row2.remove(at: 0))`", comment:"Hint"),
NSLocalizedString("You can place characters other than just Hopper! When you initialize a character, pass in one of the three [enumeration](glossary://enumeration) choices for the `name` parameter:\n\n    Character(name: .byte)\n    Character(name: .blu)\n    Character(name: .hopper)", comment:"Hint")
]

let solution: String? = "```swift\nvar row2 = world.coordinates(inRows: [2])\nvar discardedCoordinates: [Coordinate] = []\n\nfor i in 1...12 {\n   for coordinate in row2 {\n      world.place(Block(), at: coordinate)\n   }\n   discardedCoordinates.append(row2.remove(at: 0))\n}\n\nfor coordinate in discardedCoordinates {\n   world.place(Character(), at: coordinate)\n}"


public func assessmentPoint() -> AssessmentResults {
    return updateAssessment(successMessage: success, failureHints: hints, solution: solution)
}

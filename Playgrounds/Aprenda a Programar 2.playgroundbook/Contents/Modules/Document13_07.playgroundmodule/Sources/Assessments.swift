//
//  Assessments.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//

import Foundation
import Book

let success = NSLocalizedString("### You found it! \n\nRemember, finding and fixing [bugs](glossary://bug) is an important part of being a coder! An [index out of range error](glossary://index%20out%20of%20range%20error) is one of the most common bugs to cause apps to crash. When planning your code, always check that you aren’t trying to access parts of the array that don’t exist. \n\n[**Next Page**](@next)", comment:"Success message")

#if targetEnvironment(macCatalyst)
let resetHint = NSLocalizedString("Make sure you aren’t removing any more code than is necessary to correct the [index out of range error](glossary://index%20out%20of%20range%20error). If you can’t figure out what you already deleted, try resetting the page by choosing \"Start Page Over\" from the \"File\" menu.", comment:"Hint macCatalyst")
#else
let resetHint = NSLocalizedString("Make sure you aren’t removing any more code than is necessary to correct the [index out of range error](glossary://index%20out%20of%20range%20error). If you can’t figure out what you already deleted, try resetting the page by pressing the three-dot button (···) at the top of the page and choosing \"Start Page Over\".", comment:"Hint")
#endif

let hints = [
NSLocalizedString("The [index out of range error](glossary://index%20out%20of%20range%20error) happens when you try to use an index that’s outside of that array’s bounds.", comment:"Hint"),
NSLocalizedString("Look at the [index](glossary://index) values that you try to access in your code. If your array has nine items, which line of code tries to access an item that isn’t in the array?", comment:"Hint"),
resetHint
]

let solution: String? = "```swift\nvar teamBlu: [Character] = []\nfor i in 1...9 {\n   teamBlu.append(Character(name: .blu))\n}\n\nvar columnPlacement = 0\nfor blu in teamBlu {\n   world.place(blu, at: Coordinate(column: columnPlacement, row: 4))\n         columnPlacement += 1\n}\n\nteamBlu[0].jump()\nteamBlu[2].collectGem()\nteamBlu[4].jump()\nteamBlu[6].collectGem()\nteamBlu[8].jump()\n"


public func assessmentPoint() -> AssessmentResults {
    return updateAssessment(successMessage: success, failureHints: hints, solution: solution)
}

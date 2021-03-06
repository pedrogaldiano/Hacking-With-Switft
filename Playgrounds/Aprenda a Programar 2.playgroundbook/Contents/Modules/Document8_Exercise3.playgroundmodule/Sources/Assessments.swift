//
//  Assessments.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//

import Foundation
import Book

var success = NSLocalizedString("### Way to go! \nWith variables, you can store information and use it to make decisions about how your code will run. Now try using this skill in some more puzzles! \n\n[**Next Page**](@next)", comment:"Success message")
var hints = [
    NSLocalizedString("You need to run your code while the value of `gemCounter` is less than 7. You’ll need to use the `<` [comparison operator](glossary://comparison%20operator) to write the condition in your `while` loop.", comment:"Hint"),
    NSLocalizedString("If your character is on a gem, collect it, then increment `gemCounter`. If blocked, turn around and go in the opposite direction.", comment:"Hint"),
]

import PlaygroundSupport


let solution = "```swift\nvar gemCounter = 0\n\nwhile gemCounter < 7 {\n   if isOnGem {\n      collectGem()\n      gemCounter = gemCounter + 1\n   }\n   if isBlocked {\n      turnRight()\n      turnRight()\n   }\n   moveForward()\n}"


public func assessmentPoint() -> AssessmentResults {
    
    let checker = ContentsChecker(contents: PlaygroundPage.current.text)
    
    
    
    let isOnGemCondidtionalNode = checker.conditionalNodes.filter { $0.condition.contains("isOnGem") }.first
    let body = isOnGemCondidtionalNode?.body.reduce("") { total, node in
        let expr = node as? Expression
        return total! + (expr?.identifier ?? "")
    }

    if let b = body, b.contains("=") && b.contains("+") {
        success = NSLocalizedString("### Way to go! \nIsn’t it handy using [variables](glossary://variable) with [comparison operators](glossary://comparison%20operator) to create a [Boolean](glossary://Boolean) condition? You can store information in a variable, and use that information to make decisions about how your code will run. Now try using this skill in some more puzzles! \n\n[**Next Page**](@next)", comment:"Success message")
    } else {
        hints[0] = NSLocalizedString("Remember, you should only increment `gemCounter` if your character has picked up a gem. One way to do this is to increment your variable inside an `if` statement with a condition checking for a gem: \n\n    while gemCounter < 7 {\n       if isOnGem {\n          collectGem()\n          gemCounter = gemCounter + 1\n       }\n    }\n", comment:"Hint")
    }
    
    return updateAssessment(successMessage: success, failureHints: hints, solution: solution)
}





//
//  Assessments.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//

import Foundation
import Book

let success = NSLocalizedString("### What a masterpiece! \n\nRandomization gives you the power to create a slightly different result each time you run your code. In addition to generating a random integer, you can create a random [Boolean](glossary://Boolean) value (either `true` or `false`) using the `randomBool()` function. Here’s one way you might use it:\n\n* callout(Using a random Boolean):\n\n    `if randomBool() {`\n\n        world.removeAllBlocks(at: coordinate)\n    `}`\n\n[**Next Page**](@next)", comment:"Success message")
let hints = [
NSLocalizedString("Use the `randomInt` function to generate a series of random numbers and append them to `heights`. You can use a [`for` loop](glossary://for%20loop) to do this.", comment:"Hint"),
NSLocalizedString("Add a set of interesting rules to your code so that the landscape you generate is full of characters, gems, water, and more!", comment:"Hint"),
NSLocalizedString("This puzzle is a **challenge** and has no provided solution. Use your creativity to create something completely new!", comment:"Hint")

]

let solution: String? = nil


public func assessmentPoint() -> AssessmentResults {
    return updateAssessment(successMessage: success, failureHints: hints, solution: solution)
}

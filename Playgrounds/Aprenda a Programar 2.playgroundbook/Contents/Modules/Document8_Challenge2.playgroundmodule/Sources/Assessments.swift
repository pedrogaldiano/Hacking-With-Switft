//
//  Assessments.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//

import Foundation
import Book

let success = NSLocalizedString("### You’ve got it! \nUsing multiple variables gives you more information that you can use to make your code specific and adaptable in new situations. Just be sure your variables’ names say exactly what they’re keeping track of (like `gemCounter`). Otherwise, you might not remember what they’re storing! \n\n[**Next Page**](@next)", comment:"Success message")

let hints = [
                NSLocalizedString("You now need to manage two variables: one to track gems and one to track open switches.", comment:"Hint"),
                NSLocalizedString("If your character is on a gem, collect it, and then increment `gemCounter` by one. If your character is on a switch, toggle it, and then increment `switchCounter` by one. Use conditional code to stop collecting gems when the value of `gemCounter` reaches `3`.", comment:"Hint"),
                NSLocalizedString("You can use the [OR operator](glossary://logical%20OR%20operator) (||) with a `while` loop to tell your code when to stop running. \n\n- Example: `while gemCounter < 3 || switchCounter < 4`", comment:"Hint"),
                NSLocalizedString("This puzzle is a **challenge** and has no provided solution. Strengthen your coding skills by creating your own approach to solving it.", comment:"Hint")

]


let solution: String? = nil 

public func assessmentPoint() -> AssessmentResults {
    return updateAssessment(successMessage: success, failureHints: hints, solution: solution)
}

//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
**Goal:** Collect *exactly* seven gems.
 
 You’ve learned to use a [variable](glossary://variable) to keep track of a changing value, incrementing it when needed. In this new puzzle, you’ll use this knowledge to collect *exactly* seven gems. The gems appear not only in random *locations*, but also at random *times*.
 
 To solve the puzzle, you’ll need to use a `while` loop with a [Boolean](glossary://Boolean) condition that returns `false` after you’ve collected all seven gems. You’ll use a [comparison operator](glossary://comparison%20operator) (`<`) to compare the `gemCounter` value to the [Int](glossary://Int) value of 7.
 
 * callout(Using a comparison operator):

     `while gemCounter < 7 {`\
     `}`
 
 1. steps: [Declare](glossary://declaration) your `gemCounter` variable and set the value to 0.
 2. Increment the `gemCounter` value each time your character collects a gem.
 3. Use a `while` loop to keep collecting gems until all seven are collected.
*/
//#-hidden-code

import Document8_Exercise3

playgroundPrologue()
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, hide, Page_Contents)
//#-code-completion(currentmodule, show)
//#-code-completion(identifier, show, isOnOpenSwitch, if, func, for, while, moveForward(), turnLeft(), turnRight(), collectGem(), toggleSwitch(), isOnGem, isOnClosedSwitch, var, =, <, >, ==, !=, +=, +, -, isBlocked, true, false, isBlockedLeft, &&, ||, !, 0, isBlockedRight)
//#-editable-code

//#-end-editable-code
//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code


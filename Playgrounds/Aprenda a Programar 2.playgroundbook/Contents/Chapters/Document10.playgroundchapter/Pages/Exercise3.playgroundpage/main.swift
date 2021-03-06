//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
**Goal:** Initialize one instance of type `Expert` and one of type `Character`.
 
 When writing code, it’s common to use multiple instances and elements that work together to solve a bigger problem. If you’re building a photo-editing app, for example, you need to work with a camera to capture images, and a filter library to apply interesting effects.
 
 In this puzzle, you’ll need the lock-picking abilities of your expert to help you get your character through the portal to a gem on a remote platform.
 
 1. steps: Create an instance of [type](glossary://type) `Expert` and an instance of type `Character`.
 2. Tell your expert to turn the lock.
 3. Tell your character to use the portal and collect both gems.
*/
//#-code-completion(everything, hide)
//#-code-completion(identifier, hide, Page_Contents)
//#-code-completion(currentmodule, show)
//#-code-completion(identifier, show, isOnOpenSwitch, if, func, for, while, moveForward(), turnLeft(), turnRight(), collectGem(), toggleSwitch(), isOnGem, Expert, Character, (, ), (), turnLockUp(), turnLockDown(), isOnClosedSwitch, var, ., let, =, <, >, ==, !=, +=, +, -, isBlocked, true, false, isBlockedLeft, &&, ||, !, isBlockedRight)
//#-hidden-code

import Document10_Exercise3

playgroundPrologue()
typealias Character = Actor
//#-end-hidden-code
let expert = /*#-editable-code*/<#initialize#>/*#-end-editable-code*/
let character = /*#-editable-code*/<#initialize#>/*#-end-editable-code*/
//#-hidden-code
if let expert = expert as? Expert, let character = character as? Character {
    world.place(expert, facing: east, at: Coordinate(column: 2, row: 7))
    world.place(character, facing: west, at: Coordinate(column: 3, row: 1))
}
//#-end-hidden-code
//#-editable-code Enter the rest of your solution here

//#-end-editable-code
//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code


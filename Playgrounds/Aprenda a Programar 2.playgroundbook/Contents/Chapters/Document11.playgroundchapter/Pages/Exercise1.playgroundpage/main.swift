//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
**Goal:** Write a function to move forward a certain number of times.
 
In this puzzle, a new function lets you move across multiple tiles using a single command, reducing the repetition in your code. Using a [parameter](glossary://parameter), you’ll specify an input (`distance`) for your function. When you [call](glossary://call) the function, you’ll pass in a value, or [argument](glossary://argument), for `distance`. For example, in `move(distance: 6)`, `6` is the argument.
 
The function declaration for `move` is provided below with a `distance` parameter. Use the `distance` value in the function to specify how many times to run `moveForward()`. When you call `move`, pass in the argument for `distance` to run `moveForward()` that number of times.
 
1. steps: Fill in the function definition, using the `distance` parameter in a loop that calls `moveForward()` a given number of times.
2. If you use a [`for` loop](glossary://for%20loop), make `distance` the number of times the loop runs. Example: `for i in 1 ... distance {`
3. Solve the puzzle using the `move` function.
*/
//#-code-completion(everything, hide)
//#-code-completion(identifier, hide, Page_Contents)
//#-code-completion(currentmodule, show)
//#-code-completion(identifier, show, isOnOpenSwitch, if, func, for, while, moveForward(), turnLeft(), turnRight(), collectGem(), toggleSwitch(), isOnGem, Expert, Character, (, ), (), turnLockUp(), turnLockDown(), isOnClosedSwitch, var, let, ., =, <, >, ==, !=, +=, +, -, isBlocked, true, false, isBlockedLeft, &&, ||, !, isBlockedRight)
//#-hidden-code

import Document11_Exercise1

playgroundPrologue()
typealias Character = Actor
//#-end-hidden-code
let expert = /*#-editable-code*/<#initialize#>/*#-end-editable-code*/
//#-hidden-code
if let expert = expert as? Expert {
    world.place(expert, facing: east, at: Coordinate(column: 0, row: 8))
}
//#-end-hidden-code

func move(distance: Int) {
    //#-editable-code Add commands to your function
    
    //#-end-editable-code
}
//#-editable-code

//#-end-editable-code
//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code


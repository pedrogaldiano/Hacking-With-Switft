//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Use a function, a loop, and a condition to collect gems or activate switches.
 
In this puzzle, every other forward movement might lead to a gem, a switch, or nothing at all. When you run the puzzle, the [wireframes](glossary://wireframe) show the locations where items might appear. To solve the puzzle, you could write lots of [``if`` statements](glossary://if%20statement), but there’s a better way.

Start by breaking the puzzle into its basic patterns. There are three major paths, each with two possible gem or switch locations.
 
1. steps: Using an `if` statement, define the `collectOrToggle()` [function](glossary://function) to check the contents of a tile.
2. Below your function definition, call `collectOrToggle()` and other commands to solve the puzzle.
*/
//#-code-completion(everything, hide)
//#-code-completion(identifier, hide, Page_Contents)
//#-code-completion(currentmodule, show)
//#-code-completion(identifier, show, isOnOpenSwitch, moveForward(), isOnGem, isOnClosedSwitch, turnLeft(), collectGem(), toggleSwitch(), turnRight(), if, func, for)
//#-hidden-code

import Document4_Exercise4

playgroundPrologue()
//#-end-hidden-code
func collectOrToggle() {
    //#-editable-code

    //#-end-editable-code
}
//#-editable-code

//#-end-editable-code


//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code


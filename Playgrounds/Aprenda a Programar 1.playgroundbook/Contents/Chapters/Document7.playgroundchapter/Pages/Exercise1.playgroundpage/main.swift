//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Use the Right-Hand Rule algorithm to navigate around walls.
 
Run this puzzle, and notice how your character stops after the first gem. The algorithm used here follows the [right-hand rule](glossary://right-hand%20rule) to move around walls. To solve the puzzle, you’ll need to tweak the algorithm, but first try using [pseudocode](glossary://pseudocode) to plan the action.

Pseudocode looks a bit like [Swift](glossary://Swift) code, but it’s worded and structured so humans can easily understand it.
 
    navigate around wall {
       if blocked to the right {
          move forward
       } else {
          turn right
          move forward
       }
    }
 
    while not on closed switch {
       navigate around wall
       if on gem {
          collect gem
          turn around
       }
    }
    toggle switch
 
 1. steps: Based on the pseudocode above, write out a solution in code for the puzzle.
 2. Run your code and tweak your algorithm, if necessary, to solve the puzzle.
*/
//#-code-completion(everything, hide)
//#-code-completion(identifier, hide, Page_Contents)
//#-code-completion(currentmodule, show)
//#-code-completion(identifier, show, isOnOpenSwitch, moveForward(), turnLeft(), turnRight(), collectGem(), toggleSwitch(), isOnGem, isOnClosedSwitch, isBlocked, isBlockedLeft, &&, ||, !, isBlockedRight, if, while, func, for)
//#-hidden-code

import Document7_Exercise1

playgroundPrologue()
//#-end-hidden-code
//#-editable-code
func navigateAroundWall() {
    if isBlockedRight {
        moveForward()
    }  else {
        turnRight()
        moveForward()
    }
}
    
while !isOnGem {
    navigateAroundWall()
}
//#-end-editable-code

//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code


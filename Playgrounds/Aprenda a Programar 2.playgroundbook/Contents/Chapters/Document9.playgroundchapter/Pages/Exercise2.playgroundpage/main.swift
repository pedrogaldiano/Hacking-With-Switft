//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
**Goal:** Modify the state of each portal to gather the gems.
 
 In this puzzle, there are two portals, and you’ll need to use both of them to move your character to other parts of the puzzle world. But you’ll also need to *walk* across some areas, so you have to refer to each portal [instance](glossary://instance) separately to modify the `isActive` [property](glossary://property).
 
To do this, you must set the [state](glossary://state) of each portal instance. State is the stored information of a [variable](glossary://variable) at any given time. So while sometimes a portal instance stores an `isActive` value of `true`, other times it stores a value of `false`.
 
1. steps: Plan how to activate and deactivate each portal to collect all the gems.
2. Use dot notation to modify the `isActive` [property](glossary://property) for `bluePortal` and `pinkPortal` as you solve the puzzle.
*/
//#-hidden-code

import Document9_Exercise2

playgroundPrologue()
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, hide, Page_Contents)
//#-code-completion(currentmodule, show)
//#-code-completion(identifier, show, isOnOpenSwitch, if, func, for, while, moveForward(), turnLeft(), turnRight(), collectGem(), toggleSwitch(), isOnGem, isOnClosedSwitch, var, ., =, isActive, true, false, isBlocked, true, false, isBlockedLeft, bluePortal, pinkPortal, &&, ||, !, isBlockedRight)
//#-editable-code

//#-end-editable-code
//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code


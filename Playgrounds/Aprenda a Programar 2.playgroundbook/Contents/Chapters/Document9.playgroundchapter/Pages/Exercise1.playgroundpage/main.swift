//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Deactivate the portal to reach the switches.
 
Up to now, you’ve called functions in a general way, using `moveForward()` or `turnLeft()`. These functions have worked for moving your character around, but you can’t use them for other items in the puzzle world; for example, a portal. 
 
 To deactivate a portal, you’ll use [dot notation](glossary://dot%20notation) to change the value of the `isActive` [property](glossary://property) on a specific portal [instance](glossary://instance).
 
* callout(Using dot notation): Rules for writing code that a computer understands are known as [syntax](glossary://syntax). Dot notation syntax looks like this:
 
     `greenPortal.isActive = true`
 
 1. steps: Use dot notation to set the `isActive` property of the `greenPortal` instance to `false`.
 2. Toggle open each switch.
*/
//#-hidden-code

import Document9_Exercise1

playgroundPrologue()
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, hide, Page_Contents)
//#-code-completion(currentmodule, show)
//#-code-completion(identifier, show, isOnOpenSwitch, if, func, for, while, moveForward(), turnLeft(), turnRight(), collectGem(), toggleSwitch(), isOnGem, isOnClosedSwitch, var, ., =, isActive, true, false, isBlocked, isBlockedLeft, &&, ||, !, isBlockedRight, greenPortal)
//#-editable-code
greenPortal.isActive = true
//#-end-editable-code
//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code


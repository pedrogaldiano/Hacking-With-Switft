//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Add a new block to bridge two worlds.
 
 Up to now, the puzzle world has been defined for you. Now you can start making changes to that world. 
 
 The switch in this puzzle is in an unreachable area, so you’ll need to add a tile to connect the two pieces of the puzzle.
 
 * callout(Placing a block): Here’s how you would place a block at coordinate `(1, 1)`:
 
    `let block1 = Block()`\
    `world.place(block1, atColumn: 1, row: 1)`
 
 
 1. steps: First, create an [instance](glossary://instance) of type `Block`.
 2. Next, use [dot notation](glossary://dot%20notation) to access the `world` instance and [call](glossary://call) the `place` [method](glossary://method).
 3. Pass your [arguments](glossary://argument) into the `place` method. Use your `Block` instance for the `item` parameter, and a set of coordinates for the `atColumn` and `row` parameters.

*/
//#-hidden-code

import Document12_Exercise1

playgroundPrologue()
typealias Character = Actor
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, hide, Page_Contents)
//#-code-completion(currentmodule, show)
//#-code-completion(identifier, show, isOnOpenSwitch, if, func, for, while, moveForward(), turnLeft(), turnRight(), collectGem(), toggleSwitch(), north, south, east, west, Expert, Character, Block, (, ), (), turnLockUp(), turnLockDown(), isOnClosedSwitch, isOnGem, var, let, ., =, <, >, ==, !=, +=, +, -, isBlocked, move(distance:), jump(), true, false, turnLock(up:numberOfTimes:), world, place(_:facing:atColumn:row:), place(_:atColumn:row:), isBlockedLeft, &&, ||, !, isBlockedRight)
//#-editable-code

//#-end-editable-code
//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code


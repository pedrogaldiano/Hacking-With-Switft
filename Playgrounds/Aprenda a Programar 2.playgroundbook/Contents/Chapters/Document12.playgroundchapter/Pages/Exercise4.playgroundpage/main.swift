//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Change all elements of the world to create your own puzzle!
 
 In addition to placing new blocks, stairs, and portals, you can also add gems and switches.
 
 * callout(Adding gems and switches): Just like when you add a block, you use the `place` [method](glossary://method) on `world` to place gems and switches.

     `world.place(Gem(), atColumn: 2, row: 3)`\
     `world.place(Switch(), atColumn: 3, row: 4)`

 The shortcut bar contains the [methods](glossary://method) available on the `world` [instance](glossary://instance). See if you can figure out how to add a wall without seeing the code here first!
 
 1. steps: Add, change, or remove existing parts of the puzzle world by calling methods on the `world` instance.
 2. After you’ve added a few gems and switches, use your character to solve the puzzle.
*/
//#-code-completion(everything, hide)
//#-code-completion(identifier, hide, Page_Contents)
//#-code-completion(currentmodule, show)
//#-code-completion(literal, show, color)
//#-code-completion(identifier, show, isOnOpenSwitch, if, func, for, while, moveForward(), turnLeft(), turnRight(), collectGem(), toggleSwitch(), north, south, east, west, Expert, Character, (, ), (), Portal, color:, (color:), Block, Stair, Gem, Switch, turnLockUp(), turnLockDown(), isOnClosedSwitch, var, let, ., =, <, >, ==, !=, +=, +, -, isBlocked, isOnGem, move(distance:), jump(), true, false, turnLock(up:numberOfTimes:), world, place(_:facing:atColumn:row:), place(_:atColumn:row:), removeBlock(atColumn:row:), isBlockedLeft, &&, ||, !, isBlockedRight)
//#-hidden-code

import Document12_Exercise4

playgroundPrologue()
typealias Character = Actor
//#-end-hidden-code
//#-editable-code

//#-end-editable-code
//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code


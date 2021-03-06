//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
**Challenge:** Change all elements of the world to create your own puzzle!
 
In addition to placing new blocks, stairs, and portals, you can also add gems and switches.
 
* callout(Adding gems and switches): Just like when you add a block, you use the `place` [method](glossary://method) on `world` to place gems and switches.
 
    `world.place(Gem(), atColumn: 2, row: 3)`\
    `world.place(Switch(), atColumn: 3, row: 4)`
 
The shortcut bar contains the [methods](glossary://method) available on the `world` [instance](glossary://instance). Use these methods to create your own puzzle—add your own characters, experts, gems, portals, and more! Be creative, and have fun!
*/
//#-code-completion(everything, hide)
//#-code-completion(identifier, hide, Page_Contents)
//#-code-completion(currentmodule, show)
//#-code-completion(literal, show, color)
//#-code-completion(identifier, show, isOnOpenSwitch, if, func, for, while, moveForward(), turnLeft(), turnRight(), collectGem(), toggleSwitch(), north, south, east, west, Expert, Character, (, ), (), turnLockUp(), turnLockDown(), isOnClosedSwitch, var, let, ., =, <, >, ==, !=, +=, +, -, isBlocked, isOnGem, move(distance:), Character, Expert, (, ), (), Portal, color:, (color:), Block, Gem, Stair, Switch, Platform, (onLevel:controlledBy:), onLevel:controlledBy:, PlatformLock, jump(), true, false, turnLock(up:numberOfTimes:), world, place(_:facing:atColumn:row:), place(_:atStartColumn:startRow:atEndColumn:endRow:), place(_:atColumn:row:), removeItems(atColumn:row:), isBlockedLeft, &&, ||, !, isActive, isBlockedRight)
//#-hidden-code

import Document12_Challenge4

playgroundPrologue()
typealias Character = Actor
//#-end-hidden-code
//#-editable-code

//#-end-editable-code
//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code


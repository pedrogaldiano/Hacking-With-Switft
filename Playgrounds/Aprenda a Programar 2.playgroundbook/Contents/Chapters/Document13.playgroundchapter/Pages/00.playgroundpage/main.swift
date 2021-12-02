//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Add new items to an array.
 
In the code below, you’ve been given an [array](glossary://array) of integers, named `rows`. Your goal is to add values to this array to place an instance of your character at each row in the puzzle world.
 
To add items to your array, press and drag the square brackets `[]`, or type a new value separated by a comma.
 
Look for **comments** to give you guidance about the code you need to write.
 
    // This is a code comment. It gives information about the code, but the app does not run it.
 
 1. Steps: Run the code to see what happens.
 2. Add values to the array to place your character on every tile in the puzzle world.
*/
//#-hidden-code

import Document13_00

playgroundPrologue()
typealias Character = Actor
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, hide, Page_Contents)
//#-code-completion(literal, show, color, array)
//#-code-completion(currentmodule, show)
//#-code-completion(description, show, "[Int]")
//#-code-completion(identifier, show, isOnOpenSwitch, if, func, for, while, moveForward(), turnLeft(), turnRight(), collectGem(), toggleSwitch(), isBlocked, north, south, east, west, Water, Expert, Character, (, ), (), turnLockUp(), turnLockDown(), isOnClosedSwitch, var, let, ., =, <, >, ==, !=, +=, +, -, >=, <=, isBlocked, move(distance:), Character, Expert, (, ), (), Portal, color:, (color:), Block, Gem, Stair, Switch, Platform, (onLevel:controlledBy:), onLevel:controlledBy:, PlatformLock, jump(), true, false, turnLock(up:numberOfTimes:), world, place(_:facing:atColumn:row:), place(_:atColumn:row:), removeBlock(atColumn:row:), isBlockedLeft, &&, ||, !, isBlockedRight, Coordinate, column:row:), (column:row:), column:row:, place(_:at:), remove(at:), insert(_:at:), removeItems(at:), append(_:), count, column(_:), row(_:), removeFirst(), removeLast(), randomInt(from:to:), removeAll(), allPossibleCoordinates, coordinates(inRows:), coordinates(inColumns:), column, row)
//#-editable-code
//#-localizable-zone(ch13ex00k1)
// Add any missing rows to your array.
//#-end-localizable-zone
var rows = [0, 1, 3, 4]

//#-localizable-zone(ch13ex00k2)
// Places a character on each row in rows.
//#-end-localizable-zone
placeCharacters(at: rows)
//#-end-editable-code
//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code


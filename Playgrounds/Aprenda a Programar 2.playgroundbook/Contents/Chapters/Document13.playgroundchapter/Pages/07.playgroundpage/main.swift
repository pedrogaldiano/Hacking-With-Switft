//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Identify and fix an index out of range error.
 
You can access an item in an array by using its [index](glossary://index), allowing you to use the item just like any other variable.

* callout(Using an index to access an item):
 
    `let characters = [`\
       `Character(name: .byte),`\
       `Character(name: .blu),`\
       `Character(name: .hopper)`\
    `]`\
    \
    **`characters[0].toggleSwitch`**: Byte toggles a switch\
    **`characters[2].jump()`**: Hopper jumps

 However, be careful that you don’t try to access an item that doesn’t exist! This will cause an [index out of range error](glossary://index%20out%20of%20range%20error), a [bug](glossary://bug) that prevents your application from running.
 
* callout(Index out of range error): There’s no item at index `3`, so your code won’t run.
 
    `characters[3].collectGem()`
 
The code below contains an index out of range error that prevents the code from running. Find the error, fix it, and run your code.
*/
//#-hidden-code

import Document13_07

playgroundPrologue()
typealias Character = Actor
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, hide, Page_Contents)
//#-code-completion(literal, show, color, array)
//#-code-completion(currentmodule, show)
//#-code-completion(description, show, "[Int]")
//#-code-completion(identifier, show, isOnOpenSwitch, if, func, for, while, moveForward(), turnLeft(), turnRight(), collectGem(), toggleSwitch(), isBlocked, north, south, east, west, Water, Expert, Character, (, ), (), turnLockUp(), turnLockDown(), isOnClosedSwitch, var, let, ., =, <, >, ==, !=, +=, +, -, >=, <=, isBlocked, move(distance:), Character, Expert, (, ), (), Portal, color:, (color:), Block, Gem, Stair, Switch, Platform, (onLevel:controlledBy:), onLevel:controlledBy:, PlatformLock, jump(), true, false, turnLock(up:numberOfTimes:), world, isBlockedLeft, &&, ||, !, isBlockedRight, Coordinate, column:row:), (column:row:), column:row:, place(_:at:), place(_:facing:at:), remove(at:), insert(_:at:), removeItems(at:), removeAllBlocks(at:), append(_:), count, column(_:), row(_:), removeFirst(), removeLast(), randomInt(from:to:), removeAll(), allPossibleCoordinates, coordinates(inRows:), coordinates(inColumns:), column, row)
//#-editable-code
var teamBlu: [Character] = []

//#-localizable-zone(ch13ex07k1)
// Note how many instances of Blu are in your array.
//#-end-localizable-zone
for i in 1...9 {
    teamBlu.append(Character(name: .blu))
}

//#-localizable-zone(ch13ex07k2)
// Place Blu at each column in row 4.
//#-end-localizable-zone
var columnPlacement = 0
for blu in teamBlu {
    world.place(blu, at: Coordinate(column: columnPlacement, row: 4))
    columnPlacement += 1
}

//#-localizable-zone(ch13ex07k3)
// Find the index out of range error.
//#-end-localizable-zone
teamBlu[0].jump()
teamBlu[2].collectGem()
teamBlu[4].jump()
teamBlu[6].collectGem()
teamBlu[8].jump()
teamBlu[10].collectGem()

//#-end-editable-code
//#-hidden-code
for i in 1...5 {
    lock.movePlatforms(up: true)
}
playgroundEpilogue()
//#-end-hidden-code


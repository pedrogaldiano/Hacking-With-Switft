//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
**Goal:** Place five stacked blocks at each corner.

Check out the code below. Instead of an array of [Int](glossary://Int) values, you now have an array of type `Coordinate`.
    
* callout(The Coordinate type):
    
    An instance of `Coordinate` references a location, taking arguments for `column` and `row`.\
    `let corner = Coordinate(column: 3, row: 3)`

Using the `blockLocations` array, you can iterate over each coordinate and perform an action at each location; for example:
    
    for coordinate in blockLocations {
       world.place(Gem(), at: coordinate)
    }
 
 1. steps: Add two coordinates to `blockLocations`, one for each remaining corner of the world.
 2. Use a `for`-`in` loop to [iterate](glossary://iteration) over each coordinate, placing **five blocks** at each corner. (You might need to [nest](glossary://nest) another [`for` loop](glossary://for%20loop).)
*/
//#-hidden-code

import Document13_02

playgroundPrologue()
typealias Character = Actor
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, hide, Page_Contents)
//#-code-completion(literal, show, color, array)
//#-code-completion(currentmodule, show)
//#-code-completion(description, show, "[Int]")
//#-code-completion(identifier, show, isOnOpenSwitch, if, func, for, while, moveForward(), turnLeft(), turnRight(), collectGem(), toggleSwitch(), isBlocked, north, south, east, west, Water, Expert, Character, (, ), (), turnLockUp(), turnLockDown(), isOnClosedSwitch, var, let, ., =, <, >, ==, !=, +=, +, -, >=, <=, isBlocked, move(distance:), Character, Expert, (, ), (), Portal, color:, (color:), Block, Gem, Stair, Switch, Platform, (onLevel:controlledBy:), onLevel:controlledBy:, PlatformLock, jump(), true, false, turnLock(up:numberOfTimes:), world, removeBlock(atColumn:row:), isBlockedLeft, &&, ||, !, isBlockedRight, Coordinate, column:row:), (column:row:), column:row:, place(_:at:), place(_:facing:at:), remove(at:), insert(_:at:), removeItems(at:), append(_:), count, column(_:), row(_:), removeFirst(), removeLast(), randomInt(from:to:), removeAll(), allPossibleCoordinates, coordinates(inRows:), coordinates(inColumns:), column, row)
//#-editable-code
//#-localizable-zone(ch13ex02k1)
// Add the two remaining corner coordinates.
//#-end-localizable-zone
var blockLocations = [
    Coordinate(column: 0, row: 0),
    Coordinate(column: 3, row: 3),
    <#Insert a new coordinate#>
]
//#-localizable-zone(ch13ex02k2)
// Place five blocks at each coordinate.
//#-end-localizable-zone
for coordinate in <#T##array name##[Coordinate]#> {

}
//#-end-editable-code
//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code


//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Append to an empty array based on coordinate properties.
 
 Adding each item to an array individually is *really* repetitive. What if you could create a set of rules for the coordinates to include in your array?
 
 First, start with `allCoordinates`, an [array](glossary://array) of all the coordinates in the puzzle world.
 
 Next, you’ll need an empty array to append your coordinates to. And because you’re [declaring](glossary://declaration) an array with no stored values, you’ll need to specify the [type](glossary://type) of items it should hold.
 
 * callout(Creating an empty array): Use **`:`** after your variable name to declare its type, then [assign](glossary://assignment) it an empty array.
 
    `var newLocations: [Coordinate] = []`
 
 Finally, [iterate](glossary://iteration) over `allCoordinates` and check the `column` and `row` [properties](glossary://property) of each coordinate. If the `column` property of a coordinate is greater than `5`, **or** its `row` property is less than `4`, append it to your empty array. Then place six blocks on each coordinate in the array.
*/
//#-hidden-code

import Document13_04

playgroundPrologue()
typealias Character = Actor
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, hide, Page_Contents)
//#-code-completion(literal, show, color, array)
//#-code-completion(currentmodule, show)
//#-code-completion(description, show, "[Int]")
//#-code-completion(identifier, show, isOnOpenSwitch, if, func, for, while, moveForward(), turnLeft(), turnRight(), collectGem(), toggleSwitch(), isBlocked, north, south, east, west, Water, Expert, Character, (, ), (), turnLockUp(), turnLockDown(), isOnClosedSwitch, var, let, ., =, <, >, ==, !=, +=, +, -, >=, <=, isBlocked, move(distance:), Character, Expert, (, ), (), Portal, color:, (color:), Block, Gem, Stair, Switch, Platform, (onLevel:controlledBy:), onLevel:controlledBy:, PlatformLock, jump(), true, false, turnLock(up:numberOfTimes:), world, removeBlock(atColumn:row:), isBlockedLeft, &&, ||, !, isBlockedRight, Coordinate, column:row:), (column:row:), column:row:, place(_:at:), place(_:facing:at:), remove(at:), insert(_:at:), removeItems(at:), append(_:), count, column(_:), row(_:), removeFirst(), removeLast(), randomInt(from:to:), removeAll(), allPossibleCoordinates, coordinates(inRows:), coordinates(inColumns:), column, row)
let allCoordinates = world.allPossibleCoordinates
var blockSet: [Coordinate] = []

//#-editable-code
for coordinate in allCoordinates {
//#-localizable-zone(ch13ex04k1)
    // Check for coordinates with a column > 5 OR a row < 4.
//#-end-localizable-zone
    if coordinate.column > 2 && coordinate.row < 5 {
//#-localizable-zone(ch13ex04k2)
        // Append coordinate to blockSet.
//#-end-localizable-zone
        
    }
}

//#-localizable-zone(ch13ex04k3)
// For each coordinate in blockSet, place six blocks.
//#-end-localizable-zone
for <#item#> in <#array#> {
    
}

//#-end-editable-code
//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code


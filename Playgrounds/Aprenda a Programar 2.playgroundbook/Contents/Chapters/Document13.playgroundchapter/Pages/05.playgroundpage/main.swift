//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Challenge:** Build an island surrounded by a sea.
 
 Tired of being landlocked? Use code to create your very own island!
 
 First, create two empty [arrays](glossary://array) that each store an array of coordinates. One will store coordinates for the *island*, and the other will store coordinates for the *sea*.
 
 Next, write a set of conditions within your [`if` statement](glossary://if%20statement) to append coordinates to your island array. These coordinates should be in the center of the map, and might be a 3x3 or 4x4 block. Append any coordinates that don’t meet these conditions to your sea array.
 
 * callout(Adding water): To add water, remove existing blocks first.
 
    `world.removeAllBlocks(at: coordinate)`\
    `world.place(Water(), at: coordinate)`
 
 After you’ve appended coordinates to each array, place blocks for each coordinate in the island array, and water for coordinates in the sea array. Good luck!
*/
//#-hidden-code

import Document13_05

playgroundPrologue()
typealias Character = Actor
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, hide, Page_Contents)
//#-code-completion(literal, show, color, array)
//#-code-completion(currentmodule, show)
//#-code-completion(description, show, "[Int]")
//#-code-completion(identifier, show, isOnOpenSwitch, if, func, for, while, moveForward(), turnLeft(), turnRight(), collectGem(), toggleSwitch(), isBlocked, north, south, east, west, Water, Expert, Character, (, ), (), turnLockUp(), turnLockDown(), isOnClosedSwitch, var, let, ., =, <, >, ==, !=, +=, +, -, >=, <=, isBlocked, move(distance:), Character, Expert, (, ), (), Portal, color:, (color:), Block, Gem, Stair, Switch, Platform, (onLevel:controlledBy:), onLevel:controlledBy:, PlatformLock, jump(), true, false, turnLock(up:numberOfTimes:), world, place(_:facing:at:), removeBlock(atColumn:row:), isBlockedLeft, &&, ||, !, isBlockedRight, Coordinate, column:row:), (column:row:), column:row:, place(_:at:), remove(at:), insert(_:at:), removeItems(at:), removeAllBlocks(at:), append(_:), count, column(_:), row(_:), removeFirst(), removeLast(), randomInt(from:to:), removeAll(), allPossibleCoordinates, coordinates(inRows:), coordinates(inColumns:), column, row)
//#-editable-code
let allCoordinates = world.allPossibleCoordinates
//#-localizable-zone(ch13ex05k1)
// Create two empty arrays of type [Coordinate].
//#-end-localizable-zone

for coordinate in allCoordinates {
    if <#condition#> {
//#-localizable-zone(ch13ex05k2)
        // Append to island array.
//#-end-localizable-zone
        
    } else {
//#-localizable-zone(ch13ex05k3)
        // Append to sea array.
//#-end-localizable-zone
        
    }
}
//#-localizable-zone(ch13ex05k4)
// For your island array, place blocks.
//#-end-localizable-zone
for <#item#> in <#array#> {
    
}

//#-localizable-zone(ch13ex05k5)
// For your sea array, place water.
//#-end-localizable-zone
for <#item#> in <#array#> {
    
}

//#-end-editable-code
//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code


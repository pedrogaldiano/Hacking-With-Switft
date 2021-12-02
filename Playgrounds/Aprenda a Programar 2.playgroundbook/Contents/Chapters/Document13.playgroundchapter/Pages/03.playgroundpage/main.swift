//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Place Blu, Hopper, and the expert in order by height.
 
The `Array` [type](glossary://type) comes with a set of [methods](glossary://method) that let you add or remove items from your [array](glossary://array).
 
 * callout(Array methods):
   
    **`remove(at: Int)`**. Removes an item at an [index](glossary://index).\
    **`append(newElement: Element)`**. Adds an item to the end of the array.\
    **`insert(newElement: Element, at: Int)`**. Inserts an item at a specific index.

Use [dot notation](glossary://dot%20notation) to call a method on an array.

- example:\
  `var favoriteFoods = [🌮, 🍓, 🍣, 🍳, 🧀]`\
  \
  `favoriteFoods.remove(at: 2)`\
  Calling `remove(at: 2)` removes 🍣 from the array.\
  `// [🌮, 🍓, 🍳, 🧀]`\
  \
  `favoriteFoods.insert(🍝, at: 1)`\
  Calling `insert(🍝, at: 1)` adds 🍝 at index `1`.\
  `// [🌮, 🍝, 🍓, 🍳, 🧀]`

1. steps: In the `characters` array below, remove the portal and gem.
2. Insert an instance of type `Expert` so that the characters are arranged from *shortest* in the front (row `0`) to *tallest* in the back.
*/
//#-hidden-code

import Document13_03

playgroundPrologue()
typealias Character = Actor
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, hide, Page_Contents)
//#-code-completion(literal, show, color, array)
//#-code-completion(currentmodule, show)
//#-code-completion(description, show, "[Int]")
//#-code-completion(identifier, show, isOnOpenSwitch, if, func, for, while, moveForward(), turnLeft(), turnRight(), collectGem(), toggleSwitch(), isBlocked, north, south, east, west, Water, Expert, Character, (, ), (), turnLockUp(), turnLockDown(), isOnClosedSwitch, var, let, ., =, <, >, ==, !=, +=, +, -, >=, <=, isBlocked, move(distance:), Character, Expert, (, ), (), Portal, color:, (color:), Block, Gem, Stair, Switch, Platform, (onLevel:controlledBy:), onLevel:controlledBy:, PlatformLock, jump(), true, false, turnLock(up:numberOfTimes:), world, place(_:facing:at:), removeBlock(atColumn:row:), isBlockedLeft, &&, ||, !, isBlockedRight, Coordinate, column:row:), (column:row:), column:row:, place(_:at:), remove(at:), insert(_:at:), removeItems(at:), append(_:), count, column(_:), row(_:), removeFirst(), removeLast(), randomInt(from:to:), removeAll(), allPossibleCoordinates, coordinates(inRows:), coordinates(inColumns:), column, row)
//#-hidden-code
var characters: [Item]
//#-end-hidden-code
characters = [
    Character(name: .blu),
    Portal(color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)),
    Character(name: .hopper),
    Gem()
]
//#-editable-code

//#-localizable-zone(ch13ex03k1)
// Remove the portal.
//#-end-localizable-zone

//#-localizable-zone(ch13ex03k2)
// Remove the gem.
//#-end-localizable-zone

//#-localizable-zone(ch13ex03k3)
// Insert the expert.
//#-end-localizable-zone

var rowPlacement = 0
for character in characters {
    world.place(character, at: Coordinate(column: 1, row: rowPlacement))
    rowPlacement += 1
}

//#-end-editable-code
//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code


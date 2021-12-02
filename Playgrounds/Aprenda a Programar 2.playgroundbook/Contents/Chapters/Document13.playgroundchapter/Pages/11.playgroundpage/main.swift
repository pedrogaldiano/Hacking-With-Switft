//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Challenge:** Create a dance performance using arrays of characters.
 
 You’ve come a long way in writing your own code. Now it’s time to read and modify some existing code!
 
    // This is a code comment. The app does not run it, so you can write what you want!
 
 Comments help you to organize your code and keep track of what’s happening in each section. Use the comments in the code below to help you read and understand what each individual piece of code does.
 
 1. steps: Experiment with modifying and adding to the existing code below to create a dance performance that you like.
 2. Change as much as you’d like, and add some flare to the code to make it your own. 

 Remember, there are no wrong answers here! 
*/
//#-hidden-code

import Document13_11

import PlaygroundSupport

playgroundPrologue()
typealias Character = Actor
let key = "success"
if currentPageRunCount == 2 {
    PlaygroundKeyValueStore.current[key] = .integer(0)
}
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, hide, Page_Contents)
//#-code-completion(literal, show, color, array)
//#-code-completion(currentmodule, show)
//#-code-completion(description, show, "[Int]")
//#-code-completion(identifier, show, isOnOpenSwitch, if, func, for, while, moveForward(), turnLeft(), turnRight(), collectGem(), toggleSwitch(), isBlocked, north, south, east, west, Water, Expert, Character, (, ), (), turnLockUp(), turnLockDown(), isOnClosedSwitch, var, let, ., =, <, >, ==, !=, +=, +, -, >=, <=, isBlocked, move(distance:), Character, Expert, (, ), (), Portal, color:, (color:), Block, Gem, Stair, Switch, Platform, (onLevel:controlledBy:), onLevel:controlledBy:, PlatformLock, jump(), true, false, turnLock(up:numberOfTimes:), world, place(_:facing:at:), place(_:between:and:), removeBlock(atColumn:row:), isBlockedLeft, &&, ||, !, isBlockedRight, Coordinate, column:row:), (column:row:), column:row:, place(_:at:), remove(at:), insert(_:at:), removeItems(at:), removeAllBlocks(at:), append(_:), count, column(_:), row(_:), removeFirst(), removeLast(), randomInt(from:to:), removeAll(), allPossibleCoordinates, danceLikeNoOneIsWatching(), turnUp(), breakItDown(), grumbleGrumble(), argh(), coordinates(inRows:), randomBool(), height(at:), movePlatforms(up:numberOfTimes:), height(at:), coordinates(inColumns:), column, row)
//#-editable-code
//#-localizable-zone(ch13ex11k1)
// Create coordinate zones.
//#-end-localizable-zone
let allCoordinates = world.allPossibleCoordinates
let backRow = world.coordinates(inRows: [9])
let insideSquare = world.coordinates(inColumns: [4,5], intersectingRows: [4,5])
let squareCorners = world.coordinates(inColumns: [2,3,6,7], intersectingRows: [3,7])

//#-localizable-zone(ch13ex11k2)
// Place platform locks.
//#-end-localizable-zone
let squareLock = PlatformLock(color: .green)
world.place(squareLock, at: Coordinate(column: 1, row: 1))
let cornerLock = PlatformLock(color: .pink)
world.place(cornerLock, at: Coordinate(column: 8, row: 1))
let backLock = PlatformLock(color: .blue)
world.place(backLock, at: Coordinate(column: 4, row: 1))

//#-localizable-zone(ch13ex11k3)
// Place characters and platforms.
//#-end-localizable-zone
for coor in insideSquare {
    world.place(Platform(onLevel: 4, controlledBy: squareLock), at: coor)
    world.place(Character(name: .hopper), at: coor)
}

for coor in squareCorners {
    world.place(Platform(onLevel: 4, controlledBy: cornerLock), at: coor)
    world.place(Expert(), at: coor)
}

for coor in backRow {
    world.place(Platform(onLevel: 2, controlledBy: backLock), at: Coordinate(column: coor.column, row: coor.row + 1))
    world.place(Character(name: .blu), facing: north, at: coor)
}

//#-localizable-zone(ch13ex11k4)
// Create arrays from existing characters.
//#-end-localizable-zone
let blus = world.existingCharacters(at: backRow)
let hoppers = world.existingCharacters(at: insideSquare)
let experts = world.existingExperts(at: squareCorners)

//#-localizable-zone(ch13ex11k5)
// Do cool stuff 🤓.
//#-end-localizable-zone
squareLock.movePlatforms(up: true, numberOfTimes: 3)

for hopper in hoppers {
    hopper.turnUp()
}

cornerLock.movePlatforms(up: true, numberOfTimes: 7)

for expert in experts {
    expert.breakItDown()
}

for blu in blus {
    blu.jump()
}
backLock.movePlatforms(up: true, numberOfTimes: 11)


for blu in blus {
    blu.turnLeft()
    blu.turnLeft()
    blu.argh()
}

//#-end-editable-code
//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code


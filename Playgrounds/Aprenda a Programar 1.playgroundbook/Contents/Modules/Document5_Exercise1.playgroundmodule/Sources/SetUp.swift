//
//  SetUp.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
import Foundation
import Book

// MARK: Globals
let world = loadGridWorld(named: "6.1")
let actor = Actor()

public func playgroundPrologue() {
    
    placeRandomElements()
    placeActor()
    
    // Must be called in `playgroundPrologue()` to update with the current page contents.
    registerAssessment(world, assessment: assessmentPoint)
    
    //// ----
    // Any items added or removed after this call will be animated.
    finalizeWorldBuilding(for: world) {
        realizeRandomElements()
    }
    //// ----
}

// Called from LiveView.swift to initially set the LiveView.
public func presentWorld() {
    setUpLiveViewWith(world)
    
}

// MARK: Epilogue

public func playgroundEpilogue() {
    sendCommands(for: world)
}

func placeRandomElements() {
    let gem = Gem()
    let stair = Stair()
    for i in 1 ... 4 {
        world.place(RandomNode(resembling: gem), at: Coordinate(column: 1, row: i))
        world.place(RandomNode(resembling: gem), at: Coordinate(column: 3, row: i))
        world.place(RandomNode(resembling: stair), facing: west, at: Coordinate(column: 2, row: i))
    }
}

func realizeRandomElements() {
    let randomLocation = Int(arc4random_uniform(4)) + 1
    world.place(Stair(), facing: west, at: Coordinate(column: 2, row: randomLocation))
    world.placeGems(at: [Coordinate(column: 1, row: randomLocation)])
    
    for i in 1 ... 4 {
        if i != randomLocation {
            world.placeGems(at: [Coordinate(column: 3, row: i)])
        }
    }
}

func placeActor() {
    world.place(actor, facing: north, at: Coordinate(column: 3, row: 0))
}

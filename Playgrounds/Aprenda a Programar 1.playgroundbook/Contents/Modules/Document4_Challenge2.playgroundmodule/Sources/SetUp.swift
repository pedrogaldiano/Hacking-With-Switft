//
//  SetUp.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
import Foundation
import Book

// MARK: Globals
let world = loadGridWorld(named: "5.6")
public let actor = Actor()

public func playgroundPrologue() {
    
    placeRandomElements()
    placeActor()

    // Must be called in `playgroundPrologue()` to update with the current page contents.
    registerAssessment(world, assessment: assessmentPoint)
    
    //// ----
    // Any items added or removed after this call will be animated.
    finalizeWorldBuilding(for: world) {
        // Realize random elements after the world has been built.
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


func placeActor() {
    world.place(actor, facing: north, at: Coordinate(column: 2, row: 2))
}

func placeRandomElements() {
    let itemCoordinates = [
        Coordinate(column: 1, row: 1),
        Coordinate(column: 1, row: 2),
        Coordinate(column: 1, row: 3),
        Coordinate(column: 2, row: 3),
        Coordinate(column: 3, row: 3),
        Coordinate(column: 3, row: 2),
        Coordinate(column: 3, row: 1),
        Coordinate(column: 2, row: 1),
    ]
    let gem = Gem()
    let switchElement = Switch()
    
    for coord in itemCoordinates {
        world.place(RandomNode(resembling: gem), at: coord)
        world.place(RandomNode(resembling: switchElement), at: coord)
    }
}

func realizeRandomElements() {
    let itemCoordinates = [
        Coordinate(column: 1, row: 1),
        Coordinate(column: 1, row: 2),
        Coordinate(column: 1, row: 3),
        Coordinate(column: 2, row: 3),
        Coordinate(column: 3, row: 3),
        Coordinate(column: 3, row: 2),
        Coordinate(column: 3, row: 1),
        Coordinate(column: 2, row: 1),
        
    ]
    world.placeRandomGemOrSwitch(at: itemCoordinates)
}

//
//  Setup.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
import Foundation
import Book

// MARK: Globals
let world: GridWorld = loadGridWorld(named: "4.3")
let actor = Actor()

public func playgroundPrologue() {
    
    placeActor()
    placeItems()
    placePortals()
    

    // Must be called in `playgroundPrologue()` to update with the current page contents.
    registerAssessment(world, assessment: assessmentPoint)
    
    //// ----
    // Any items added or removed after this call will be animated.
    finalizeWorldBuilding(for: world)
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
    world.place(actor, facing: north, at: Coordinate(column: 1, row: 0))
}

func placePortals() {
    world.place(Portal(color: .green), between: Coordinate(column: 3, row: 1), and: Coordinate(column: 0, row: 5))
    world.place(Portal(color: .pink), between: Coordinate(column: 1, row: 3), and: Coordinate(column: 6, row: 2))
    world.place(Portal(color: .blue), between: Coordinate(column: 4, row: 1), and: Coordinate(column: 7, row: 5))
}

func placeItems() {
    let items = [
                    Coordinate(column: 0, row: 1),
                    Coordinate(column: 1, row: 1),
                    Coordinate(column: 2, row: 1),
                    Coordinate(column: 1, row: 2),
                    
                    Coordinate(column: 5, row: 1),
                    Coordinate(column: 6, row: 1),
                    Coordinate(column: 7, row: 1),
                    Coordinate(column: 6, row: 0),
                    
                    Coordinate(column: 6, row: 6),
                    Coordinate(column: 6, row: 5),
                    Coordinate(column: 6, row: 4),
                    Coordinate(column: 5, row: 5),
                    
                    Coordinate(column: 1, row: 6),
                    Coordinate(column: 1, row: 5),
                    Coordinate(column: 1, row: 4),
                    Coordinate(column: 2, row: 5),
                    
                    ]
    world.placeGems(at: items)
}

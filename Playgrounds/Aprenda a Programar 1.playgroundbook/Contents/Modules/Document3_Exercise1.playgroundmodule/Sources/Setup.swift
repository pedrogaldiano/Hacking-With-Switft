//
//  Setup.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
import SceneKit
import PlaygroundSupport
import Book

// MARK: Globals
let world = loadGridWorld(named: "3.1")
let actor = Actor()

public func playgroundPrologue() {
    
    placeActor()
    placeItems()
    placeWalls()
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
    world.place(actor, facing: east, at: Coordinate(column: 0, row: 5))
}

func placeItems() {
    let items = [
                    Coordinate(column: 2, row: 1),
                    Coordinate(column: 2, row: 2),
                    Coordinate(column: 2, row: 3),
                    Coordinate(column: 2, row: 4),
                    Coordinate(column: 2, row: 5),
                    
                    ]
    world.placeGems(at: items)
}

func placePortals() {
    world.place(Portal(color: .blue), between: Coordinate(column: 3, row: 5), and: Coordinate(column: 0, row: 4))
    world.place(Portal(color: .green), between: Coordinate(column: 3, row: 4), and: Coordinate(column: 0, row: 3))
    world.place(Portal(color: .pink), between: Coordinate(column: 3, row: 3), and: Coordinate(column: 0, row: 2))
    world.place(Portal(color: .yellow), between: Coordinate(column: 3, row: 2), and: Coordinate(column: 0, row: 1))
}

func placeWalls() {
    world.place(Wall(edges: [.top, .bottom]), at: Coordinate(column: 2, row: 1))
    world.place(Wall(edges: [.top, .bottom]), at: Coordinate(column: 2, row: 3))
    world.place(Wall(edges: [.bottom]), at: Coordinate(column: 2, row: 5))
    world.place(Wall(edges: [.top, .bottom]), at: Coordinate(column: 1, row: 1))
    world.place(Wall(edges: [.top, .bottom]), at: Coordinate(column: 1, row: 3))
    world.place(Wall(edges: [.bottom]), at: Coordinate(column: 1, row: 5))
}

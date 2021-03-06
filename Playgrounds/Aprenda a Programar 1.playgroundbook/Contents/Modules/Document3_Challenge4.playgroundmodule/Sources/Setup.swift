//
//  Setup.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
import SceneKit
import PlaygroundSupport
import Book

// MARK: Globals
let world: GridWorld = loadGridWorld(named: "4.2")
let actor = Actor()

public func playgroundPrologue() {
    
    placeActor()
    placeWalls()
    placeItems()
    

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
    world.place(actor, facing: east, at: Coordinate(column: 0, row: 2))
}

func placeItems() {
    let items = [
                    Coordinate(column: 0, row: 0),
                    Coordinate(column: 1, row: 0),
                    Coordinate(column: 2, row: 0),
                    
                    Coordinate(column: 0, row: 1),
                    Coordinate(column: 1, row: 1),
                    Coordinate(column: 2, row: 1),
                    ]
    world.placeGems(at: items)
    
    let dropZones = [
                        Coordinate(column: 0, row: 3),
                        Coordinate(column: 0, row: 4),
                        
                        Coordinate(column: 1, row: 3),
                        Coordinate(column: 1, row: 4),
                        
                        Coordinate(column: 2, row: 3),
                        Coordinate(column: 2, row: 4)
                        ]
    world.place(nodeOfType: Switch.self, at: dropZones)
}

func placeWalls() {
    world.place(Wall(edges: [.right, .left]), at: Coordinate(column: 1, row: 0))
    world.place(Wall(edges: [.right, .left]), at: Coordinate(column: 1, row: 1))
    world.place(Wall(edges: [.right, .left]), at: Coordinate(column: 3, row: 0))
    world.place(Wall(edges: [.right, .left]), at: Coordinate(column: 3, row: 1))
    world.place(Wall(edges: [.right, .left]), at: Coordinate(column: 1, row: 4))
    world.place(Wall(edges: [.right, .left]), at: Coordinate(column: 1, row: 4))
}

//
//  SetUp.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
import Foundation
import Book

// MARK: Globals
let world = loadGridWorld(named: "7.2")
public let actor = Actor()

public func playgroundPrologue() {
    
    placeRandomItems()
    placePortals()
    placeActor()
    
    
    // Must be called in `playgroundPrologue()` to update with the current page contents.
    registerAssessment(world, assessment: assessmentPoint)
    
    //// ----
    // Any items added or removed after this call will be animated.
    finalizeWorldBuilding(for: world) {
        realizeRandomItems()
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
    world.place(actor, facing: south, at: Coordinate(column: 0, row: 6))
}

func placePortals() {
    world.place(Portal(color: .yellow), between: Coordinate(column: 0, row: 2), and: Coordinate(column: 2, row: 5))
    world.place(Portal(color: .pink), between: Coordinate(column: 2, row: 0), and: Coordinate(column: 4, row: 6))
}

func placeRandomItems() {
    let switches = [
        Coordinate(column: 0, row: 5),
        Coordinate(column: 0, row: 4),
        Coordinate(column: 0, row: 3),
        
        Coordinate(column: 2, row: 4),
        Coordinate(column: 2, row: 3),
        Coordinate(column: 2, row: 2),
        Coordinate(column: 2, row: 1),
        
        Coordinate(column: 4, row: 5),
        Coordinate(column: 4, row: 4),
        Coordinate(column: 4, row: 3),
        Coordinate(column: 4, row: 2),
        ]
    let switchNode = Switch()
    for eachSwitch in switches {
        world.place(RandomNode(resembling: switchNode), at: eachSwitch)
    }
}

func realizeRandomItems() {
    let switches = [
        Coordinate(column: 0, row: 5),
        Coordinate(column: 0, row: 4),
        Coordinate(column: 0, row: 3),
        
        Coordinate(column: 2, row: 4),
        Coordinate(column: 2, row: 3),
        Coordinate(column: 2, row: 2),
        Coordinate(column: 2, row: 1),
        
        Coordinate(column: 4, row: 5),
        Coordinate(column: 4, row: 4),
        Coordinate(column: 4, row: 3),
        Coordinate(column: 4, row: 2),
        ]
    
    let switchNodes = world.place(nodeOfType: Switch.self, at: switches)
    for switchNode in switchNodes {
        if arc4random_uniform(6) % 2 == 0 {
            switchNode.isOn = true
        } else {
            switchNode.isOn = false
        }
    }
}

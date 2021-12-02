//
//  SetUp.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
import Foundation
import Book

// MARK: Globals
public let world = GridWorld(columns: 4, rows: 4)


public func playgroundPrologue() {
    pageIdentifier = "13.02"
    Display.coordinateMarkers = true
    let successPlacements = [
        Coordinate(column: 0, row: 0),
        Coordinate(column: 3, row: 0),
        Coordinate(column: 0, row: 3),
        Coordinate(column: 3, row: 3)
    ]
    
    let handler = assessment(world.blocksPresent(count: 6, at: successPlacements))
    world.successCriteria = .custom(.ignoreGoals, handler)
    
   

    
    // Must be called in `playgroundPrologue()` to update with the current page contents.
    registerAssessment(world, assessment: assessmentPoint)
    
    //// ----
    // Any items added or removed after this call will be animated.
    finalizeWorldBuilding(for: world)
    //// ----
}

public func presentWorld() {
    setUpLiveViewWith(world)
}

// MARK: Epilogue
    
public func playgroundEpilogue() {
    sendCommands(for: world)
}



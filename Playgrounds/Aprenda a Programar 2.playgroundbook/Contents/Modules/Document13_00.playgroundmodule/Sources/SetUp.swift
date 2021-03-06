//
//  SetUp.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
import Foundation
import Book

// MARK: Globals
public let world = GridWorld(columns: 1, rows: 6)


public func playgroundPrologue() {
    pageIdentifier = "13.00"
    Display.coordinateMarkers = true
   
    let allCoords = world.allPossibleCoordinates
    
    let handler = assessment(world.coveredInCharacters(at: allCoords))
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

public func placeCharacters(at rows: [Int]) {
    for row in rows {
        world.place(Character(), atColumn: 0, row: row)
    }
}



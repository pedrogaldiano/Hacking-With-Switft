//
//  SetUp.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
import Foundation
import Book

// MARK: Globals
public let world = GridWorld(columns: 10, rows: 10)


public func playgroundPrologue() {
    pageIdentifier = "13.11"
    Display.coordinateMarkers = true
   
    let handler = assessment(world.didChangePageText(differenceCount: 3))
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



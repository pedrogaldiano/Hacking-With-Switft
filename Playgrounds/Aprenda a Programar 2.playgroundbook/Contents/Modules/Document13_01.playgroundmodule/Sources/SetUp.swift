//
//  SetUp.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
import Foundation
import Book

// MARK: Globals
public let world = GridWorld(columns: 5, rows: 3)


public func playgroundPrologue() {
    pageIdentifier = "13.01"
    
    Display.coordinateMarkers = true
   
    placeWater()
    
    // Base the `successCriteria` on ensuring that every coordinate is covered.
    world.successCriteria = .custom(.ignoreGoals, world.coveredInGemsAndSwitches)
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

func placeWater() {
    let rows1and2 = world.coordinates(inRows: [0,2])
    world.removeItems(at: rows1and2, ignoringBlocks: false)
    world.placeWater(at: rows1and2)
}

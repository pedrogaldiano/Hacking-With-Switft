//
//  SetUp.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
import Foundation
import Book

// MARK: Globals
let world = loadGridWorld(named: "9.2")
let actor = Actor()

public var finalGemCount = 0
public var initialGemCount = 0

public func playgroundPrologue() {
    placeActor()
    placeItems()
    
    let handler = assessment(world.collectedGemsAndUserVariablesAreCorrectlyAssigned(userVariableValues: (finalGemCount, initialGemCount), expectedVariableValues: (5,0)))
    
    world.successCriteria = .custom(.allGoals, handler)

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
    world.place(actor, facing: east, at: Coordinate(column: 0, row: 1))
}

func placeItems() {
    let itemCoords = [
                         Coordinate(column: 1, row: 1),
                         Coordinate(column: 2, row: 1),
                         Coordinate(column: 3, row: 1),
                         Coordinate(column: 4, row: 1),
                         Coordinate(column: 5, row: 1),
                         
                         ]
    world.placeGems(at: itemCoords)
}

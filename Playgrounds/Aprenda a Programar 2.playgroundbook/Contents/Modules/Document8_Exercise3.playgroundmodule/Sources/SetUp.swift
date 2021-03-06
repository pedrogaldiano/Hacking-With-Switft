//
//  SetUp.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
import Foundation
import Book

// MARK: Globals
let world = loadGridWorld(named: "9.4")
let actor = Actor()
var gemRandomizer: RandomizedQueueObserver?

public func playgroundPrologue() {
    world.successCriteria = .count(collectedGems: 7, openSwitches: 0)
    
    placeActor()
    placeRandomPlaceholders()

    world.place(Wall(edges: .bottom), at: Coordinate(column: 2, row: 2))
    
    // Must be called in `playgroundPrologue()` to update with the current page contents.
    registerAssessment(world, assessment: assessmentPoint)
    
    //// ----
    // Any items added or removed after this call will be animated.
    finalizeWorldBuilding(for: world) {
        realizeRandomGems()
    }
    //// ----
    generateGemsOverTime()
}

func placeActor() {
    world.place(actor, facing: south, at: Coordinate(column: 2, row: 4))
}

// Called from LiveView.swift to initially set the LiveView.
public func presentWorld() {
    setUpLiveViewWith(world)
    
}

// MARK: Epilogue

public func playgroundEpilogue() {
    sendCommands(for: world)
}

func placeRandomPlaceholders() {
    let gem = Gem()
    let actorCoordinate = [Coordinate(column: 2, row: 4)]
    let coordinates = Set(world.coordinates(inColumns: [2], intersectingRows: 2...6)).subtracting(Set(actorCoordinate))
    
    for i in coordinates {
        world.place(RandomNode(resembling: gem), at: i)
    }
}

func realizeRandomGems() {
    let coordinates = world.coordinates(inColumns: [2], intersectingRows: [2,3,5,6])
    for coordinate in coordinates {
        let random = Int(arc4random_uniform(8))
        if random % 2 == 0 {
            world.place(Gem(), at: coordinate)
        }
    }

}

func generateGemsOverTime() {

    gemRandomizer = RandomizedQueueObserver(randomRange: 0...5, world: world) { world in
        let coordinates = world.coordinates(inColumns: [2], intersectingRows: [2,3,4,5,6])
        
        let existingGemCount = world.existingGems(at: coordinates).count
        guard existingGemCount < 3 else { return }
        
        for coordinate in Set(coordinates) {
            if world.existingGems(at: [coordinate]).isEmpty && world.existingCharacters(at: [coordinate]).isEmpty {
                world.place(Gem(), at: coordinate)
                
                // Only place one gem.
                return
            }
        }
    }
}

//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Adjust your algorithm to navigate around extra blocks.
 
This puzzle is similar to the previous one, but additional blocks around the walls prevent your [right-hand rule](glossary://right-hand%20rule) algorithm from working properly. In some situations, you’re blocked on the right, but you can’t move forward because you’re also blocked in the front.
 
 * callout(Right-hand rule):
    Adjust your algorithm to deal with these situations:\
    ![Byte is blocked by a block in front and a block on the right.](Byte_turn1.png) Blocked on the right and in front.\
    ![Byte is blocked by a block on the right.](Byte_turn2.png) Blocked on the right.\
    ![Byte is not blocked in the front or on the right.](Byte_turn3.png) Not blocked.
 
To fix this, you’ll need to tweak your algorithm. The image above shows the three different situations your character will encounter, and the arrows suggest how to respond for each one. Can you modify `navigateAroundWall()` to handle each situation?
 
 1. Use [pseudocode](glossary://pseudocode) to think through how your character should move in the three situations above.
 2. Based on your pseudocode, tweak the existing code below, then run it to see what happens.
*/
//#-code-completion(everything, hide)
//#-code-completion(identifier, hide, Page_Contents)
//#-code-completion(currentmodule, show)
//#-code-completion(identifier, show, isOnOpenSwitch, moveForward(), turnLeft(), turnRight(), collectGem(), toggleSwitch(), isOnGem, isOnClosedSwitch, isBlocked, isBlockedLByte_turn@2x.pngeft, &&, ||, !, isBlockedRight, if, while, func, for)
//#-hidden-code

import Document7_Exercise2

playgroundPrologue()
//#-end-hidden-code
//#-editable-code
func navigateAroundWall() {
    if isBlockedRight {
        moveForward()
    }  else {
        turnRight()
        moveForward()
    }
}
    
while !isOnClosedSwitch {
    navigateAroundWall()
    if isOnGem {
        collectGem()
        turnLeft()
        turnLeft()
    }
}
toggleSwitch()
//#-end-editable-code
//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code


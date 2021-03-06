//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Challenge:** Test the state of the world to change your route.
 
For this last challenge, you need to collect the gems and toggle the switches along the center platform, but several paths take you away from it.

You can use [conditional code](glossary://conditional%20code) to detect whether your character is on a gem or a closed switch, and take a different action **if** your character is on one instead of the other. 
 
    for i in 1...5 {
       moveForward()
       if isOnGem {
          solveRightSide()
       } else if isOnClosedSwitch {
          solveLeftSide()
       }
    }
*/
//#-code-completion(everything, hide)
//#-code-completion(identifier, hide, Page_Contents)
//#-code-completion(currentmodule, show)
//#-code-completion(identifier, show, isOnOpenSwitch, isBlocked, moveForward(), turnLeft(), collectGem(), toggleSwitch(), turnRight(), if, func, for, isOnGem, isOnClosedSwitch)
//#-hidden-code

import Document4_Challenge3

playgroundPrologue()
//#-end-hidden-code
//#-editable-code

//#-end-editable-code


//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code


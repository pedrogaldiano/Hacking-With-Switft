//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Use the NOT operator to adjust your character’s path when there’s no gem on a tile.
 
 The [logical NOT operator (`!`)](glossary://logical%20NOT%20operator) changes the value of a [Boolean](glossary://Boolean) to its opposite—it *inverts* the value.
 
 For example, if the condition `isBlocked` is *false*, then `!isBlocked` is *true*.
 
 Run the puzzle a few times to see what changes. Notice that there are always four gems, but one is at the bottom of a stairway. When there’s no gem on the top platform, the stairs extend from that tile.
 
 Use `!` to determine when your character is NOT on a gem. If not on a gem, turn and collect the gem at the end of the stairs. Otherwise, collect the gem.
*/
//#-hidden-code

import Document5_Exercise1

playgroundPrologue()
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, hide, Page_Contents)
//#-code-completion(currentmodule, show)
//#-code-completion(identifier, show, isOnOpenSwitch, moveForward(), turnLeft(), collectGem(), toggleSwitch(), turnRight(), if, func, for, isOnGem, isOnClosedSwitch, isBlocked, !)
//#-editable-code
for i in 1 ... 4 {
    moveForward()
}
//#-end-editable-code

//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code


//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Use the AND operator to combine two conditions and adjust your path if both are true.
 
The [logical AND operator (`&&`)](glossary://logical%20AND%20operator) combines two [Boolean](glossary://Boolean) conditions and runs your code only if *both* are true. For example, in the following code, `isBlocked` AND `isOnClosedSwitch` must both be true.
 
    if isBlocked && isOnClosedSwitch {
        toggleSwitch()
    }
 
  * callout(New condition!):

     The [Boolean](glossary://Boolean) condition `isBlockedLeft` is **true** if you *can’t* move 1 tile to the left and **false** if you can make that move.
 
1. steps: Add an `if` statement in the `for` loop, then add a condition to check whether your character is on a gem.
2. In the shortcut bar, select `&&`, then add a second condition.
3. If your character is on a gem AND blocked on the left, turn right and toggle the switch. Otherwise, if on a gem, collect it.
*/
//#-code-completion(everything, hide)
//#-code-completion(identifier, hide, Page_Contents)
//#-code-completion(currentmodule, show)
//#-code-completion(identifier, show, isOnOpenSwitch, moveForward(), turnLeft(), turnRight(), collectGem(), toggleSwitch(), isOnGem, isOnClosedSwitch, isBlocked, isBlockedLeft, if, func, for, !, &&)
//#-hidden-code

import Document5_Exercise2

playgroundPrologue()
//#-end-hidden-code
//#-editable-code
for i in 1 ... 7 {
    moveForward()
}
//#-end-editable-code


//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code


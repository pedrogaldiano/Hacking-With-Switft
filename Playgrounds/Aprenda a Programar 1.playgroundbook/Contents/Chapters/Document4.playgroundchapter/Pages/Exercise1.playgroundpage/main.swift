//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Use an [``if`` statement](glossary://if%20statement) to toggle only closed switches.
 
Try running this puzzle a few times before you write any code. You’ll notice three switches on the walkway, each *randomly* toggled open or closed.

If you toggle a switch that’s already open, the switch will close. You’ll need to use an [``if`` statement](glossary://if%20statement) to check each switch before toggling it.

Use ``isOnClosedSwitch`` as the **condition** in the ``if`` statement so you can tell your character, “If you’re on a closed switch, toggle the switch.”
 
 
     if isOnClosedSwitch {
         toggleSwitch()
     }

 1. steps: Move to the first switch.
 2. Select `if` in the shortcut bar to add an `if` statement.
 3. Add the condition ``isOnClosedSwitch``, and toggle the switch if true.
 4. Repeat for the two remaining switches.
*/
//#-hidden-code

import Book
import Document4_Exercise1

playgroundPrologue()
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, hide, Page_Contents)
//#-code-completion(currentmodule, show)
//#-code-completion(identifier, show, isOnOpenSwitch, moveForward(), turnLeft(), collectGem(), toggleSwitch(), turnRight(), isOnClosedSwitch, if, func, for)
//#-editable-code

//#-end-editable-code
//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code


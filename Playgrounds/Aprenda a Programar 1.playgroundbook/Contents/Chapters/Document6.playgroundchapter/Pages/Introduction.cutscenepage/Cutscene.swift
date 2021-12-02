
import PlaygroundSupport
import SPCCutsceneSupport
import Document6_Cutscenes
import UIKit

let vc = CutsceneContainerViewController(storyboardName: "LTC1_C06_WhileLoops",
                                         storyboardIDs: ["Page 1", "Page 2", "Page 3", "Page 4"],
                                         displaysPagingButtons: true)
vc.needsIncreasedScaling = false
vc.view.backgroundColor = UIColor(named:"LTC1_Background_Blue")

PlaygroundPage.current.liveView = vc

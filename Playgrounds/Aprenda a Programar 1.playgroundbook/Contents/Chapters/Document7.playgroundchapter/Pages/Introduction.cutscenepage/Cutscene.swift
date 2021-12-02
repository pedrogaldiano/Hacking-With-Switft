
import PlaygroundSupport
import SPCCutsceneSupport
import Document7_Cutscenes
import UIKit

let vc = CutsceneContainerViewController(storyboardName: "LTC1_C07_Algorithms",
                                         storyboardIDs: ["Page 1", "Page 2", "Page 3", "Page 4", "Page 5", "Page 6", "Page 7", "Page 8", "Page 9"],
                                         displaysPagingButtons: true)
vc.needsIncreasedScaling = false
vc.view.backgroundColor = UIColor(named:"LTC1_Background_Blue")

PlaygroundPage.current.liveView = vc

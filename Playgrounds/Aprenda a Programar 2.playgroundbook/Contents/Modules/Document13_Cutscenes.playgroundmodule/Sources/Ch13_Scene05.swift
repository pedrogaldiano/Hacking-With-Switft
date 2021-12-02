//
//  Ch13_Scene05.swift
//
//  Copyright © 2020 Apple, Inc. All rights reserved.
//

import UIKit
import SPCCutsceneSupport

@objc(Ch13_Scene05)
class Ch13_Scene05: SceneViewController {

    @IBOutlet weak var primaryTextLabel: UILabel!

    @IBOutlet weak var highlightBubble: UIView!
    @IBOutlet weak var calloutPointer: SPCTriangleView!
    @IBOutlet weak var calloutBubble: UIView!
    @IBOutlet weak var calloutLabel: UILabel!

    @IBOutlet weak var icecream: UIImageView!
    @IBOutlet weak var banana: UIImageView!
    @IBOutlet weak var chocolate: UIImageView!
    @IBOutlet weak var cherries: UIImageView!

    // MARK:-

    override func viewDidLoad() {
        super.viewDidLoad()

        primaryTextLabel.setAttributedText(xmlAnnotatedString:
            NSLocalizedString("But wait — why is <b>zero</b> the index for the first item?", comment: "primary text"))

        calloutLabel.text = NSLocalizedString("Computers start counting at zero, so the index of the first item in an array is 0. The second item's index is 1, the third is 2, and so on.", comment: "callout text")

        calloutElements = [
            highlightBubble,
            calloutPointer,
            calloutBubble,
            calloutLabel
        ]

        // These elements are invisible at the start of the scene.
        calloutElements.forEach { $0.alpha = 0.0 }

        // Voiceover: Provide descriptions for the images.
         icecream.makeAccessible(label: NSLocalizedString("a quart of ice cream, at index 0", comment: "accessibility label"))
         banana.makeAccessible(label: NSLocalizedString("a banana, at index 1", comment: "accessibility label"))
         chocolate.makeAccessible(label: NSLocalizedString("chocolate, at index 2", comment: "accessibility label"))
         cherries.makeAccessible(label: NSLocalizedString("cherries, at index 3", comment: "accessibility label"))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Fade in the callout.
        UIView.animate(withDuration: 0.4, delay: 1.0, options: [],
                       animations: {
                        self.calloutElements.forEach { $0.alpha = 1.0 }
        },
                       completion: { _ in
                        self.animationsDidComplete()

                        // Voiceover: Set the initial content.
                        UIAccessibility.post(notification: .screenChanged,
                                             argument: self.primaryTextLabel)
        })
    }

    // MARK:- Private

    private var calloutElements: [UIView] = []
    
}

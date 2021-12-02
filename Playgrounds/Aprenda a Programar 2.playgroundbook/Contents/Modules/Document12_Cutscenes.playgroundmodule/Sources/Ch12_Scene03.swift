//
//  Ch12_Scene03.swift
//
//  Copyright © 2020 Apple, Inc. All rights reserved.
//

import UIKit
import SPCCutsceneSupport

@objc(Ch12_Scene03)
class Ch12_Scene03: SceneViewController {

    @IBOutlet weak var primaryTextLabel: UILabel!
    @IBOutlet weak var secondaryTextLabel: UILabel!

    @IBOutlet weak var codeLabelTop: NSLayoutConstraint!

    @IBOutlet weak var calloutLabel: UILabel!
    @IBOutlet weak var calloutBubble: UIView!

    @IBOutlet weak var gemView: UIImageView!
    @IBOutlet weak var islandView: UIImageView!

    // MARK:-

    override func viewDidLoad() {
        super.viewDidLoad()

        shouldFadeIn = false
        shouldFadeOut = false

        primaryTextLabel.text = NSLocalizedString("With code, you can transform the world around you.", comment: "primary text")

        secondaryTextLabel.text = NSLocalizedString("You just describe what to build and where to build it.", comment: "secondary text")

        calloutLabel.text = NSLocalizedString("First, initialize an instance of a gem.", comment: "callout text")

        calloutElements = [
            calloutLabel,
            calloutBubble
        ]

        // These elements are invisible at the start of the scene.
        gemView.shrinkToInvisible()
        calloutElements.forEach { $0.alpha = 0.0 }

        // Voiceover: Describe the graphic elements.
        gemView.makeAccessible(label: NSLocalizedString("A glowing gem, floating in the air.", comment: "accessibility label"))
        islandView.makeAccessible(label: NSLocalizedString("A grassy island, floating in the air.", comment: "accessibility label"))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Fade out the text from the previous page.
        UIView.animate(withDuration: 0.3, delay: 0.0, options: [],
                       animations: {
                        self.primaryTextLabel.alpha = 0.0
                        self.secondaryTextLabel.alpha = 0.0
        })

        // Drop in the code.
        animateChange(to: codeLabelTop, value: 270.0, duration: 0.5, delay: 0.8)

        // Fade in the callout text.
        UIView.animate(withDuration: 0.5, delay: 1.8, options: [],
                       animations: {
                        self.calloutElements.forEach { $0.alpha = 1.0 }
        })

        // Pop in the gem.
        gemView.animateToFullSizeWithPop(duration: 0.2, delay: 2.3, then: {
            self.animationsDidComplete()

            // Voiceover: Set the initial content.
            UIAccessibility.post(notification: .screenChanged,
                                 argument: self.calloutLabel)
        })
    }

    // MARK:- Private

    private var calloutElements: [UIView] = []
}

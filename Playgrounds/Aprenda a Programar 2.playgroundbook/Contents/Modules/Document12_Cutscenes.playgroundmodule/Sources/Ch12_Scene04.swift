//
//  Ch12_Scene04.swift
//
//  Copyright © 2020 Apple, Inc. All rights reserved.
//

import UIKit
import SPCCutsceneSupport

@objc(Ch12_Scene04)
class Ch12_Scene04: SceneViewController {

    @IBOutlet weak var initLabelTop: NSLayoutConstraint!

    @IBOutlet weak var previousCalloutLabel: UILabel!
    @IBOutlet weak var previousCalloutBubble: UIView!

    @IBOutlet weak var placeLabel: UILabel!

    @IBOutlet weak var calloutLabel: UILabel!
    @IBOutlet weak var calloutBubble: UIView!
    @IBOutlet weak var calloutPointer: UIView!

    @IBOutlet weak var gemView: UIImageView!
    @IBOutlet weak var islandView: UIImageView!

    // MARK:-

    override func viewDidLoad() {
        super.viewDidLoad()

        shouldFadeIn = false
        shouldFadeOut = false

        previousCalloutLabel.text = NSLocalizedString("First, initialize an instance of a gem.", comment: "callout text")

        calloutLabel.setAttributedText(xmlAnnotatedString:
            NSLocalizedString("Next, call the <cv>place</cv> method on the <cv>world</cv> instance.", comment: "callout text; describes calling a method"))

        previousCalloutElements = [
            previousCalloutLabel,
            previousCalloutBubble
        ]

        calloutElements = [
            calloutLabel,
            calloutBubble,
            calloutPointer
        ]

        // These elements are not visible at the start of the scene.
        placeLabel.alpha = 0.0
        calloutElements.forEach { $0.alpha = 0.0 }

        // Voiceover: Describe the graphic elements.
        gemView.makeAccessible(label: NSLocalizedString("A glowing gem, floating in the air.", comment: "accessibility label"))
        islandView.makeAccessible(label: NSLocalizedString("A grassy island, floating in the air.", comment: "accessibility label"))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Fade out the callout from the previous page.
        UIView.animate(withDuration: 0.3, delay: 0.0, options: [],
                       animations: {
                        self.previousCalloutElements.forEach { $0.alpha = 0.0 }
        })

        // Move the code label up.
        UIView.animate(withDuration: 0.5, delay: 0.8, options: [],
                       animations: {
                        self.initLabelTop.constant = 112.0
                        self.view.layoutIfNeeded()
        })

        // Fade in new code.
        UIView.animate(withDuration: 0.5, delay: 1.3, options: [],
                       animations: {
                        self.placeLabel.alpha = 1.0
        })

        // Fade in new callout.
        UIView.animate(withDuration: 0.5, delay: 2.0, options: [],
                       animations: {
                        self.calloutElements.forEach { $0.alpha = 1.0 }
        },
                       completion: { _ in
                        self.animationsDidComplete()

                        // Voiceover: Set the initial content.
                        UIAccessibility.post(notification: .screenChanged,
                                             argument: self.calloutLabel)
        })
    }

    // MARK:- Private

    private var previousCalloutElements: [UIView] = []
    private var calloutElements: [UIView] = []
}

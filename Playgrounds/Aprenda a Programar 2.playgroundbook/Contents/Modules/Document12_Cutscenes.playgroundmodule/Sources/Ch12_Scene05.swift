//
//  Ch12_Scene05.swift
//
//  Copyright © 2020 Apple, Inc. All rights reserved.
//

import UIKit
import SPCCutsceneSupport

@objc(Ch12_Scene05)
class Ch12_Scene05: SceneViewController {

    @IBOutlet weak var initLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!

    @IBOutlet weak var previousCalloutLabel: UILabel!
    @IBOutlet weak var previousCalloutBubble: UIView!
    @IBOutlet weak var previousCalloutPointer: SPCTriangleView!

    @IBOutlet weak var initLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var placeLabelTop: NSLayoutConstraint!

    @IBOutlet weak var updatedPlaceLabel: UILabel!

    @IBOutlet weak var itemHighlightBubble: UIView!
    @IBOutlet weak var atColumnHighlightBubble: UIView!
    @IBOutlet weak var rowHighlightBubble: UIView!

    @IBOutlet weak var calloutBubble: UIView!
    @IBOutlet weak var calloutLabel: UILabel!

    @IBOutlet weak var gemView: UIImageView!
    @IBOutlet weak var islandView: UIImageView!
    
    // MARK:-

    override func viewDidLoad() {
        super.viewDidLoad()

        shouldFadeIn = false
        shouldFadeOut = false

        previousCalloutLabel.setAttributedText(xmlAnnotatedString:
            NSLocalizedString("Next, call the <cv>place</cv> method on the <cv>world</cv> instance.", comment: "callout text; describes calling a method"))

        calloutLabel.setAttributedText(xmlAnnotatedString:
            NSLocalizedString("The <cv>place</cv> method has three parameters:\n• <b>item</b> takes an input of type <cv>Item</cv> (such as a block, gem, or stair)\n• <b>atColumn</b> and <b>row</b> take <cv>Int</cv> values indicating where the item is to be placed", comment: "callout text; describes the place method signature"))
        calloutLabel.textAlignment = .left

        previousCalloutElements = [
            previousCalloutLabel,
            previousCalloutBubble,
            previousCalloutPointer
        ]

        calloutElements = [
            itemHighlightBubble,
            atColumnHighlightBubble,
            rowHighlightBubble,
            calloutLabel,
            calloutBubble
        ]

        // These elements are invisible at the start of the scene.
        updatedPlaceLabel.alpha = 0.0
        calloutElements.forEach { $0.alpha = 0.0 }

        // Voiceover: Describe the graphic elements.
        gemView.makeAccessible(label: NSLocalizedString("A glowing gem, floating in the air.", comment: "accessibility label"))
        islandView.makeAccessible(label: NSLocalizedString("A grassy island, floating in the air.", comment: "accessibility label"))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Fade out the existing callout.
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [],
                       animations: {
                        self.previousCalloutElements.forEach { $0.alpha = 0.0 }
        },
                       completion: { _ in

                        // Move the text.
                        self.view.removeConstraints([
                            self.initLabelCenterX,
                            self.placeLabelTop
                        ])

                        NSLayoutConstraint.activate([
                            self.initLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 86.0),
                            self.placeLabel.topAnchor.constraint(equalTo: self.initLabel.bottomAnchor, constant: 15.0)
                        ])

                        UIView.animate(withDuration: 0.8, delay: 0.3, options: [],
                                       animations: {
                                        self.view.layoutIfNeeded()
                        })

                        // Insert the parameters of the place method.
                        UIView.animate(withDuration: 0.4, delay: 1.1, options: [],
                                       animations: {
                                        self.placeLabel.alpha = 0.0
                                        self.updatedPlaceLabel.alpha = 1.0
                        })

                        // Show the callout.
                        UIView.animate(withDuration: 0.4, delay: 1.5, options: [],
                                       animations: {
                                        self.calloutElements.forEach { $0.alpha = 1.0 }
                        },
                                       completion: { _ in
                                        self.animationsDidComplete()

                                        // Voiceover: Set the initial content.
                                        UIAccessibility.post(notification: .screenChanged,
                                                             argument: self.calloutLabel)
                        })
        })
    }

    // MARK:- Private

    private var previousCalloutElements: [UIView] = []
    private var calloutElements: [UIView] = []

}

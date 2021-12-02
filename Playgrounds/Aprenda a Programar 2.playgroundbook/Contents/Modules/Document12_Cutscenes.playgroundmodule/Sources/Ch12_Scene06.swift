//
//  Ch12_Scene06.swift
//
//  Copyright © 2020 Apple, Inc. All rights reserved.
//

import UIKit
import SPCCutsceneSupport

@objc(Ch12_Scene06)
class Ch12_Scene06: SceneViewController {

    @IBOutlet weak var itemHighlightBubble: UIView!
    @IBOutlet weak var atColumnHighlightBubble: UIView!
    @IBOutlet weak var rowHighlightBubble: UIView!

    @IBOutlet weak var previousCalloutBubble: UIView!
    @IBOutlet weak var previousCalloutLabel: UILabel!

    @IBOutlet weak var placeDeclarationLabel: UILabel!
    @IBOutlet weak var placeCallLabel: UILabel!

    @IBOutlet weak var gem: UIImageView!
    @IBOutlet weak var gemLeading: NSLayoutConstraint!
    @IBOutlet weak var gemTop: NSLayoutConstraint!

    @IBOutlet weak var shadow: SPCCircleView!

    @IBOutlet weak var gemArgHighlight: UIView!
    @IBOutlet weak var fiveArgHighlight: UIView!
    @IBOutlet weak var oneArgHighlight: UIView!

    @IBOutlet weak var islandView: UIImageView!

    // MARK:-

    override func viewDidLoad() {
        super.viewDidLoad()

        shouldFadeIn = false

        previousCalloutLabel.setAttributedText(xmlAnnotatedString:
            NSLocalizedString("The <cv>place</cv> method has three parameters:\n• <b>item</b> takes an input of type <cv>Item</cv> (such as a block, gem, or stair)\n• <b>atColumn</b> and <b>row</b> take <cv>Int</cv> values indicating where the item is to be placed", comment: "callout text; describes the place method signature"))
        previousCalloutLabel.textAlignment = .left

        previousCalloutElements = [
            itemHighlightBubble,
            atColumnHighlightBubble,
            rowHighlightBubble,
            previousCalloutBubble,
            previousCalloutLabel
        ]

        calloutElements = [
            previousCalloutBubble,
            previousCalloutLabel,
            gemArgHighlight,
            fiveArgHighlight,
            oneArgHighlight
        ]

        // These elements are invisible at the start of the scene.
        placeCallLabel.alpha = 0.0
        shadow.alpha = 0.0
        gemArgHighlight.alpha = 0.0
        fiveArgHighlight.alpha = 0.0
        oneArgHighlight.alpha = 0.0

        // Voiceover: Provide a description for the animated scene.
        islandView.makeAccessible(label: NSLocalizedString("When the <cv>place</cv> method is called, the glowing gem moves to the specified coordinates on the island.", comment: "accessibility label"))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Fade out the callout.
        UIView.animate(withDuration: 0.4, delay: 0.0, options: [],
                       animations: {
                        self.previousCalloutElements.forEach { $0.alpha = 0.0 }
        },
                       completion: { _ in
                        // Change the text.
                        self.previousCalloutLabel.setAttributedText(xmlAnnotatedString:
                            NSLocalizedString("When you call the <cv>place</cv> method, pass in <cv>gem</cv> and the coordinates where you would like to place <cv>gem</cv>.", comment: "callout text; describes calling a function"))
                        self.previousCalloutLabel.sizeToFit()
                        self.view.layoutIfNeeded()

                        // Fade in the new text.
                        UIView.animate(withDuration: 0.6, delay: 0.0, options: [],
                                       animations: {
                                        self.calloutElements.forEach { $0.alpha = 1.0 }
                                        self.placeDeclarationLabel.alpha = 0.0
                                        self.placeCallLabel.alpha = 1.0
                        })

                        // Animate the gem's change in position and scale.
                        let numSteps: Int = 10
                        let relativeDuration = 1 / TimeInterval(numSteps)

                        let horizDistance: CGFloat = 470.0
                        let horizStride: CGFloat = horizDistance / CGFloat(numSteps)

                        let finalScale: CGFloat = 0.5
                        let scalingStride: CGFloat = 1.0 - (finalScale / CGFloat(numSteps))

                        let initialX = self.gemLeading.constant
                        let initialY = self.gemTop.constant

                        UIView.animateKeyframes(withDuration: 1.0, delay: 1.0, options: [],
                                                animations: {
                                                    for step in 1...numSteps {
                                                        let xOffset = CGFloat(step) * horizStride
                                                        let x = initialX + xOffset
                                                        let y = initialY - self.yOffset(at: xOffset)
                                                        UIView.addKeyframe(withRelativeStartTime: Double(step - 1) * relativeDuration,
                                                                           relativeDuration: relativeDuration) {
                                                                            self.gem.scale(by: scalingStride)
                                                                            self.gemLeading.constant = x
                                                                            self.gemTop.constant = y
                                                                            self.view.layoutIfNeeded()
                                                        }
                                                    }
                        })

                        // Show the gem's shadow.
                        UIView.animate(withDuration: 0.2, delay: 1.8, options: [],
                                       animations: {
                                        self.shadow.alpha = 0.35
                        },
                                       completion: { _ in
                                        self.animationsDidComplete()

                                        // Voiceover: Set the initial content.
                                        UIAccessibility.post(notification: .screenChanged,
                                                             argument: self.previousCalloutLabel)
                        })
        })
    }

    // MARK:- Private

    private var previousCalloutElements: [UIView] = []
    private var calloutElements: [UIView] = []

    /// This function computes a value for y from a value for x,
    /// along a shallow parabolic curve.
    private func yOffset(at x: CGFloat) -> CGFloat {

        let curveXOffset: CGFloat = 170.0
        let curveYOffset: CGFloat = 50.0
        let curveFlatness: CGFloat = 0.0017

        let xAdjusted = x - curveXOffset

        return ((xAdjusted * xAdjusted) * curveFlatness) - curveYOffset
    }
}

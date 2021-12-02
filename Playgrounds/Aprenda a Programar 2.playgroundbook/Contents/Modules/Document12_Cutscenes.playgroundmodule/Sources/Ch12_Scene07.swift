//
//  Ch12_Scene07.swift
//
//  Copyright © 2020 Apple, Inc. All rights reserved.
//

import UIKit
import SPCCutsceneSupport

@objc(Ch12_Scene07)
class Ch12_Scene07: SceneViewController {

    @IBOutlet weak var primaryTextLabel: UILabel!

    @IBOutlet weak var blockInitLabel: UILabel!
    @IBOutlet weak var blockPlaceLabel: UILabel!

    @IBOutlet weak var initCalloutLabel: UILabel!
    @IBOutlet weak var initCalloutBubble: UIView!

    @IBOutlet weak var placeCalloutLabel: UILabel!
    @IBOutlet weak var placeCalloutBubble: UIView!

    @IBOutlet weak var block: UIImageView!
    @IBOutlet weak var blockTop: NSLayoutConstraint!
    @IBOutlet weak var blockLeading: NSLayoutConstraint!

    @IBOutlet weak var islandView: UIImageView!

    // MARK:-

    override func viewDidLoad() {
        super.viewDidLoad()

        primaryTextLabel.text = NSLocalizedString("You can place a block in the same way.", comment: "primary text")

        initCalloutLabel.setAttributedText(xmlAnnotatedString:
            NSLocalizedString("1. Create an instance of type <cv>Block</cv>.", comment: "callout text; describes initializing a block"))

        placeCalloutLabel.setAttributedText(xmlAnnotatedString:
            NSLocalizedString("2. Call the <cv>place</cv> method, passing in <cv>block</cv> and the coordinates where you want it to go.", comment: "callout text; describes arguments to the place method"))

        initCalloutElements = [
            initCalloutLabel,
            initCalloutBubble
        ]

        placeCalloutElements = [
            placeCalloutLabel,
            placeCalloutBubble
        ]

        // These elements are invisible at the start of the scene.
        block.shrinkToInvisible()
        blockInitLabel.alpha = 0.0
        blockPlaceLabel.alpha = 0.0
        initCalloutElements.forEach { $0 .alpha = 0.0 }
        placeCalloutElements.forEach { $0 .alpha = 0.0 }

        // Voiceover: Provide a description for the animated scene.
        islandView.makeAccessible(label: NSLocalizedString("When the <cv>place</cv> method is called, the block moves to the specified coordinates on the island.", comment: "accessibility label"))

        // Voiceover: Ensure that the initial text that introduces the concept is included when reading this content.
        initCalloutLabel.accessibilityLabel = primaryTextLabel.text! + " " + initCalloutLabel.text!
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Fade out the primary text.
        UIView.animate(withDuration: 0.4, delay: 2.0, options: [],
                       animations: {
                        self.primaryTextLabel.alpha = 0.0
        })

        // Fade in the initialization callout.
        UIView.animate(withDuration: 0.4, delay: 2.4, options: [],
                       animations: {
                        self.initCalloutElements.forEach { $0.alpha = 1.0 }
        })

        // Fade in the line of code initializing a block.
        UIView.animate(withDuration: 0.4, delay: 3.2, options: [],
                       animations: {
                        self.blockInitLabel.alpha = 1.0
        })

        // Bring in the block image.
        self.block.animateToFullSizeWithPop(duration: 0.3, delay: 3.6)

        // Fade in the place callout.
        UIView.animate(withDuration: 0.4, delay: 4.6, options: [],
                       animations: {
                        self.placeCalloutElements.forEach { $0.alpha = 1.0 }
        })

        // Bring in the line of code with the place method and arguments.
        UIView.animate(withDuration: 0.4, delay: 5.4, options: [],
                       animations: {
                        self.blockPlaceLabel.alpha = 1.0
        },
                       completion: { _ in

                        // Animate the block into place.
                        let numSteps: Int = 10
                        let relativeDuration = 1 / TimeInterval(numSteps)

                        let horizDistance: CGFloat = 526.0
                        let horizStride: CGFloat = horizDistance / CGFloat(numSteps)

                        let finalScale: CGFloat = 0.5
                        let scalingStride: CGFloat = 1.0 - (finalScale / CGFloat(numSteps))

                        let initialX = self.blockLeading.constant
                        let initialY = self.blockTop.constant

                        UIView.animateKeyframes(withDuration: 1.0, delay: 0.0, options: [],
                                                animations: {
                                                    for step in 1...numSteps {
                                                        let xOffset = CGFloat(step) * horizStride
                                                        let x = initialX + xOffset
                                                        let y = initialY - self.yOffset(at: xOffset)
                                                        UIView.addKeyframe(withRelativeStartTime: Double(step - 1) * relativeDuration,
                                                                           relativeDuration: relativeDuration) {
                                                                            self.block.scale(by: scalingStride)
                                                                            self.blockLeading.constant = x
                                                                            self.blockTop.constant = y
                                                                            self.view.layoutIfNeeded()
                                                        }
                                                    }
                        },
                                completion: { _ in
                                    self.animationsDidComplete()

                                    // Voiceover: Set the initial content.
                                    UIAccessibility.post(notification: .screenChanged,
                                                         argument: self.initCalloutLabel)
                        })
        })
    }
    
    // MARK:- Private

    private var initCalloutElements: [UIView] = []
    private var placeCalloutElements: [UIView] = []

    /// This function computes a value for y from a value for x,
    /// along a shallow parabolic curve.
    private func yOffset(at x: CGFloat) -> CGFloat {

        let curveXOffset: CGFloat = 223.0
        let curveYOffset: CGFloat = 50.0
        let curveFlatness: CGFloat = 0.001

        let xAdjusted = x - curveXOffset

        return ((xAdjusted * xAdjusted) * curveFlatness) - curveYOffset
    }

}

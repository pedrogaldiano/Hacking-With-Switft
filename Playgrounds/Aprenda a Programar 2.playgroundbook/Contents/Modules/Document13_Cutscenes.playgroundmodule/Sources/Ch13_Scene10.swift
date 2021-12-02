//
//  Ch13_Scene10.swift
//
//  Copyright © 2020 Apple, Inc. All rights reserved.
//

import UIKit
import SPCCutsceneSupport

@objc(Ch13_Scene10)
class Ch13_Scene10: SceneViewController {

    @IBOutlet weak var primaryTextLabel: UILabel!

    @IBOutlet weak var indexHighlight: UIView!
    @IBOutlet weak var indexHighlightCenterY: NSLayoutConstraint!
    @IBOutlet weak var indexHighlightCenterX: NSLayoutConstraint!

    @IBOutlet weak var one: UILabel!
    @IBOutlet weak var two: UILabel!
    @IBOutlet weak var three: UILabel!
    @IBOutlet weak var four: UILabel!

    @IBOutlet weak var loopHighlight: UIView!
    @IBOutlet weak var argumentHighlight: UIView!

    @IBOutlet weak var icecream: UIImageView!
    @IBOutlet weak var icecreamCenterX: NSLayoutConstraint!
    @IBOutlet weak var icecreamCenterY: NSLayoutConstraint!
    @IBOutlet weak var banana: UIImageView!
    @IBOutlet weak var bananaCenterX: NSLayoutConstraint!
    @IBOutlet weak var bananaCenterY: NSLayoutConstraint!
    @IBOutlet weak var chocolate: UIImageView!
    @IBOutlet weak var chocolateCenterX: NSLayoutConstraint!
    @IBOutlet weak var chocolateCenterY: NSLayoutConstraint!
    @IBOutlet weak var sprinkles: UIImageView!
    @IBOutlet weak var sprinklesCenterX: NSLayoutConstraint!
    @IBOutlet weak var sprinklesCenterY: NSLayoutConstraint!
    @IBOutlet weak var cherries: UIImageView!
    @IBOutlet weak var cherriesCenterX: NSLayoutConstraint!
    @IBOutlet weak var cherriesCenterY: NSLayoutConstraint!

    @IBOutlet weak var bowl: UIImageView!

    @IBOutlet weak var icecreamInBowl: UIImageView!
    @IBOutlet weak var bananaInBack: UIImageView!
    @IBOutlet weak var bananaInFront: UIImageView!
    @IBOutlet weak var chocolateTopping: UIImageView!
    @IBOutlet weak var sprinklesOnTop: UIImageView!
    @IBOutlet weak var cherryOnTop: UIImageView!

    @IBOutlet weak var calloutBubble: UIView!
    @IBOutlet weak var calloutLabel: UILabel!

    @IBOutlet weak var icecreamInArray: UIImageView!
    @IBOutlet weak var bananaInArray: UIImageView!
    @IBOutlet weak var chocolateInArray: UIImageView!
    @IBOutlet weak var sprinklesInArray: UIImageView!
    @IBOutlet weak var cherriesInArray: UIImageView!

    @IBOutlet weak var completeSundae: UIView!

    // MARK:-

    override func viewDidLoad() {
        super.viewDidLoad()

        shouldFadeIn = false
        shouldFadeOut = false

        primaryTextLabel.setAttributedText(xmlAnnotatedString:
            NSLocalizedString("You can perform the same action on each item in an array, a process known as <b>iteration</b>.", comment: "primary text"))

        calloutLabel.text = NSLocalizedString("The for loop iterates over each item in the array, moving to the next item until all have been placed.", comment: "callout text; describes the opertation of a for loop")

        highlightBubbles = [
            indexHighlight,
            loopHighlight,
            argumentHighlight
        ]

        ingredients = [
            Ingredient(view: icecream, centerX: icecreamCenterX, centerY: icecreamCenterY),
            Ingredient(view: banana, centerX: bananaCenterX, centerY: bananaCenterY),
            Ingredient(view: chocolate, centerX: chocolateCenterX, centerY: chocolateCenterY),
            Ingredient(view: sprinkles, centerX: sprinklesCenterX, centerY: sprinklesCenterY),
            Ingredient(view: cherries, centerX: cherriesCenterX, centerY: cherriesCenterY)
        ]

        sundaeParts = [
            icecreamInBowl,
            bananaInBack,
            bananaInFront,
            chocolateTopping,
            sprinklesOnTop,
            cherryOnTop
        ]

        calloutElements = [
            calloutLabel,
            calloutBubble
        ]

        // These elements are transparent.
        ingredients.forEach { $0.view.alpha = 0.7 }

        // These elements are invisible at the start of the scene.
        highlightBubbles.forEach { $0.alpha = 0.0 }
        sundaeParts.forEach { $0.alpha = 0.0 }
        calloutElements.forEach { $0.alpha = 0.0 }

        // Voiceover: Provide descriptions for the images.
        icecreamInArray.makeAccessible(label: NSLocalizedString("a quart of ice cream, at index 0", comment: "accessibility label"))
        bananaInArray.makeAccessible(label: NSLocalizedString("a banana, at index 1", comment: "accessibility label"))
        chocolateInArray.makeAccessible(label: NSLocalizedString("chocolate, at index 2", comment: "accessibility label"))
        sprinklesInArray.makeAccessible(label: NSLocalizedString("sprinkles, at index 3", comment: "accessibility label"))
        cherriesInArray.makeAccessible(label: NSLocalizedString("cherries, at index 4", comment: "accessibility label"))
        completeSundae.makeAccessible(label: NSLocalizedString("a complete sundae, with ice cream, bananas, chocolate sauce, sprinkles, and a cherry on top", comment: "accessibility label"))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Fade in the highlight bubbles.
        UIView.animate(withDuration: 0.4, delay: 1.4, options: [],
                       animations: {
                        self.highlightBubbles.forEach { $0.alpha = 1.0 }
        })

        // Set the time when the move animations will start.
        var delay: TimeInterval = 1.7

        // Move each item into the bowl.
        for item in ingredients {

            // Fade the item away when it reaches the bowl.
            UIView.animate(withDuration: 0.1, delay: delay + 0.4, options: [],
                           animations: {
                            item.view.alpha = 0.0
            })

            let offsets = self.offsets(from: item.view, to: bowl)
            let stepDuration: TimeInterval = 0.5 / Double(offsets.count)

            // Animate the item from its current position into the bowl.
            for adjustment in offsets {
                UIView.animate(withDuration: stepDuration, delay: delay, options: [],
                               animations: {
                                item.centerX.constant += adjustment.x
                                item.centerY.constant += adjustment.y
                                self.view.layoutIfNeeded()
                })
                delay += stepDuration
            }

            // Wait for the highlight bubble to move.
            delay += 0.5
        }

        // Set the time when the first sundae part will appear.
        delay = 2.2

        // Fade in the ingredient in its final state in the sundae bowl.
        for item in sundaeParts {
            UIView.animate(withDuration: 0.2, delay: delay, options: [],
                           animations: {
                            item.alpha = 1.0
            })

            // Special Case: Add both bananas at the same time.
            if item != bananaInBack {
                // Our full animation cycle takes 1.0 sec.
                delay += 1.0
            }
        }

        // Set the time when the first highlight move will occur.
        delay = 2.3

        // Move the highlight bubble on the index to the next index.
        for label in [one, two, three, four] {
            UIView.animate(withDuration: 0.4, delay: delay, options: [],
                           animations: {
                            self.moveIndexHighlight(to: label!)
            })

            // Our full animation cycle takes 1.0 sec.
            delay += 1.0
        }

        // Fade in the callout.
        UIView.animate(withDuration: 0.3, delay: 7.2, options: [],
                       animations: {
                        self.calloutElements.forEach { $0.alpha = 1.0 }
                        self.highlightBubbles.forEach { $0.alpha = 0.0 }
        },
                       completion: { _ in
                        self.animationsDidComplete()

                        // Voiceover: Set the initial content.
                        UIAccessibility.post(notification: .screenChanged,
                                             argument: self.calloutLabel)
        })
    }

    // MARK:- Private

    private struct Ingredient {
        let view: UIView
        let centerX: NSLayoutConstraint
        let centerY: NSLayoutConstraint
    }
    private var ingredients: [Ingredient] = []
    private var sundaeParts: [UIImageView] = []
    private var highlightBubbles: [UIView] = []
    private var calloutElements: [UIView] = []

    private func moveIndexHighlight(to target: UIView) {
        view.removeConstraints([
            indexHighlightCenterX,
            indexHighlightCenterY
        ])

        indexHighlightCenterX = indexHighlight.centerXAnchor.constraint(equalTo: target.centerXAnchor)
        indexHighlightCenterY = indexHighlight.centerYAnchor.constraint(equalTo: target.centerYAnchor)

        NSLayoutConstraint.activate([
            indexHighlightCenterX,
            indexHighlightCenterY
        ])
        view.layoutIfNeeded()
    }

    /// This function provides x and y offsets used to create a path which ingredients
    /// follow when animating from the array into the sundae bowl.
    ///
    /// - Parameter original: The view to be moved.
    /// - Parameter target: The view onto which the original view will move.
    ///
    /// - Returns: An array of offsets, meant to be used as adjustments to the position of the animated view.
    private func offsets(from original: UIView, to target: UIView) -> [CGPoint] {

        let yValues: [CGFloat] = [-30.0, -25.0, -15.0, -10.0, 0.0, 0.0, 5.0, 10.0, 15.0, 20.0]
        let horizontalStride = (target.center.x - original.center.x) / CGFloat(yValues.count)
        var points: [CGPoint] = []

        for index in 0..<yValues.count {
            points.append(CGPoint(x: horizontalStride, y: yValues[index]))
        }

        return points
    }
}

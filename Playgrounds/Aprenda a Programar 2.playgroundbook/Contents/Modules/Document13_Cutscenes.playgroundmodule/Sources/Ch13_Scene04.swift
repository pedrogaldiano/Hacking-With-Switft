//
//  Ch13_Scene04.swift
//
//  Copyright © 2020 Apple, Inc. All rights reserved.
//

import UIKit
import SPCCutsceneSupport

@objc(Ch13_Scene04)
class Ch13_Scene04: SceneViewController {

    @IBOutlet weak var primaryTextLabel: UILabel!

    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var indexLabel: UILabel!

    @IBOutlet weak var openingBraceLeading: NSLayoutConstraint!
    @IBOutlet weak var variableDeclWidth: NSLayoutConstraint!

    @IBOutlet weak var icecream: UIImageView!
    @IBOutlet weak var banana: UIImageView!
    @IBOutlet weak var chocolate: UIImageView!
    @IBOutlet weak var cherries: UIImageView!
    @IBOutlet weak var strawberry: UIImageView!
    @IBOutlet weak var sprinkles: UIImageView!

    @IBOutlet weak var cursorOne: UIImageView!
    @IBOutlet weak var cursorTwo: UIImageView!

    @IBOutlet weak var assignmentOneLabel: UILabel!
    @IBOutlet weak var assignedStrawberry: UIImageView!

    @IBOutlet weak var assignmentTwoLabel: UILabel!
    @IBOutlet weak var assignedSprinkles: UIImageView!

    @IBOutlet weak var strawberryCenterY: NSLayoutConstraint!
    @IBOutlet weak var sprinklesCenterY: NSLayoutConstraint!

    // MARK:-

    override func viewDidLoad() {
        super.viewDidLoad()

        primaryTextLabel.setAttributedText(xmlAnnotatedString:
            NSLocalizedString("You can modify an item in the array using its <b>index</b>.", comment: "primary text"))

        itemLabel.text = NSLocalizedString("Item", comment: "label on a graphic; one item in an array of items")

        indexLabel.text = NSLocalizedString("Index", comment: "label on a graphic; the index of an item in an array")

        labels = [
            itemLabel,
            indexLabel
        ]

        strawberryWithCursor = [
            strawberry,
            cursorOne
        ]

        sprinklesWithCursor = [
            sprinkles,
            cursorTwo
        ]

        assignmentOne = [
            assignmentOneLabel,
            assignedStrawberry
        ]

        assignmentTwo = [
            assignmentTwoLabel,
            assignedSprinkles
        ]

        // These elements are invisible at the start of the scene.
        labels.forEach { $0.alpha = 0.0 }
        strawberryWithCursor.forEach { $0.alpha = 0.0 }
        sprinklesWithCursor.forEach { $0.alpha = 0.0 }
        assignmentOne.forEach { $0.alpha = 0.0 }
        assignmentTwo.forEach { $0.alpha = 0.0 }

        // Voiceover: Provide descriptions for the images.
        icecream.makeAccessible(label: NSLocalizedString("a quart of ice cream, at index 0", comment: "accessibility label"))
        strawberry.makeAccessible(label: NSLocalizedString("a strawberry, which replaced the banana, at index 1", comment: "accessibility label"))
        chocolate.makeAccessible(label: NSLocalizedString("chocolate, at index 2", comment: "accessibility label"))
        sprinkles.makeAccessible(label: NSLocalizedString("sprinkles, which replaced the cherries, at index 3", comment: "accessibility label"))
        assignedStrawberry.makeAccessible(label: NSLocalizedString("a strawberry", comment: "accessibility label"))
        assignedSprinkles.makeAccessible(label: NSLocalizedString("sprinkles", comment: "accessibility label"))

        // Voiceover: Customize the description of the array.
        itemLabel.accessibilityLabel = NSLocalizedString("an array of ingredients", comment: "accessibility label")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Animate the variable declaration away.
        UIView.animate(withDuration: 0.5, delay: 0.7, options: [],
                       animations: {
                        self.variableDeclWidth.constant = 0.0
                        self.openingBraceLeading.constant -= 110.0
                        self.view.layoutIfNeeded()
        })

        // Show the labels.
        UIView.animate(withDuration: 0.4, delay: 1.2, options: [],
                       animations: {
                        self.labels.forEach { $0.alpha = 1.0 }
        })

        // Fade in the first assignment expression.
        UIView.animate(withDuration: 0.4, delay: 2.0, options: [],
                       animations: {
                        self.assignmentOne.forEach { $0.alpha = 1.0 }
        })

        // Swap in the strawberry for the banana.
        UIView.animate(withDuration: 0.2, delay: 2.7, options: [],
                       animations: {
                        self.banana.alpha = 0.0
                        self.strawberryWithCursor.forEach { $0.alpha = 1.0 }

                        self.strawberryCenterY.constant = 0.0
                        self.view.layoutIfNeeded()
        })

        // Fade in the second assignment expression.
        UIView.animate(withDuration: 0.4, delay: 4.0, options: [],
                       animations: {
                        self.assignmentTwo.forEach { $0.alpha = 1.0 }
        })

        // Swap in the sprinkles for the cherries.
        UIView.animate(withDuration: 0.2, delay: 4.7, options: [],
                       animations: {
                        self.cherries.alpha = 0.0
                        self.sprinklesWithCursor.forEach { $0.alpha = 1.0 }

                        self.sprinklesCenterY.constant = 0.0
                        self.view.layoutIfNeeded()
        },
                       completion: { _ in
                        self.animationsDidComplete()

                        // Voiceover: Set the initial content.
                        UIAccessibility.post(notification: .screenChanged,
                                             argument: self.primaryTextLabel)
        })

    }

    // MARK:- Private

    private var labels: [UIView] = []

    private var assignmentOne: [UIView] = []
    private var assignmentTwo: [UIView] = []

    private var strawberryWithCursor: [UIView] = []
    private var sprinklesWithCursor: [UIView] = []
}

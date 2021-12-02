//
//  Ch13_Scene07.swift
//
//  Copyright © 2020 Apple, Inc. All rights reserved.
//

import UIKit
import SPCCutsceneSupport

@objc(Ch13_Scene07)
class Ch13_Scene07: SceneViewController {

    @IBOutlet weak var primaryTextLabel: UILabel!

    @IBOutlet weak var removeLabel: UILabel!
    @IBOutlet weak var removeLabelTop: NSLayoutConstraint!

    @IBOutlet weak var appendLabel: UILabel!
    @IBOutlet weak var sprinklesAsArgument: UIImageView!

    @IBOutlet weak var thirdComma: UILabel!
    @IBOutlet weak var thirdCommaLeading: NSLayoutConstraint!
    @IBOutlet weak var fourthIndex: UILabel!

    @IBOutlet weak var sprinkles: UIImageView!
    @IBOutlet weak var sprinklesCenterY: NSLayoutConstraint!

    @IBOutlet weak var icecream: UIImageView!
    @IBOutlet weak var banana: UIImageView!
    @IBOutlet weak var cherries: UIImageView!

    @IBOutlet weak var leftSquareBracket: UILabel!

    // MARK:-

    override func viewDidLoad() {
        super.viewDidLoad()

        shouldFadeIn = false
        shouldFadeOut = false

        primaryTextLabel.setAttributedText(xmlAnnotatedString:
            NSLocalizedString("In Swift, arrays come with <b>methods</b> that you can call to perform simple actions, such as removing or adding items.", comment: "primary text"))

        appendWithSprinkles = [
            appendLabel,
            sprinklesAsArgument
        ]

        commaAndIndex = [
            thirdComma,
            fourthIndex
        ]

        // These elements are invisible at the start of the scene.
        appendWithSprinkles.forEach { $0.alpha = 0.0 }
        commaAndIndex.forEach { $0.alpha = 0.0 }
        sprinkles.alpha = 0.0

        // Voiceover: Provide descriptions for the images.
        icecream.makeAccessible(label: NSLocalizedString("a quart of ice cream, at index 0", comment: "accessibility label"))
        banana.makeAccessible(label: NSLocalizedString("a banana, at index 1", comment: "accessibility label"))
        cherries.makeAccessible(label: NSLocalizedString("cherries, at index 2", comment: "accessibility label"))
        sprinkles.makeAccessible(label: NSLocalizedString("sprinkles, at index 3", comment: "accessibility label"))

        // Voiceover: Annotate the code label to better describe the scene.
        let localizedSprinkles = NSLocalizedString("sprinkles", comment: "accessibility label")
        appendLabel.accessibilityLabel = "ingredients.append( \(localizedSprinkles) ) " +
            NSLocalizedString("The sprinkles were added to the array when this code was executed.", comment: "accessibility label")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Drop out the remove method call.
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [],
                       animations: {
                        self.removeLabel.alpha = 0.0
                        self.removeLabelTop.constant += 768.0
                        self.view.layoutIfNeeded()
        })

        // Fade in the append method call.
        UIView.animate(withDuration: 0.5, delay: 0.7, options: [],
                       animations: {
                        self.appendWithSprinkles.forEach { $0.alpha = 1.0 }
        })

        // Expand the array.
        UIView.animate(withDuration: 0.5, delay: 1.7, options: [],
                       animations: {
                        self.thirdCommaLeading.constant = 69.0
                        self.view.layoutIfNeeded()
        })
        UIView.animate(withDuration: 0.2, delay: 2.0, options: [],
                       animations: {
                        self.commaAndIndex.forEach { $0.alpha = 1.0 }
        })

        // Drop in the item.
        UIView.animate(withDuration: 0.2, delay: 2.4, options: [],
                       animations: {
                        self.sprinkles.alpha = 1.0

                        self.sprinklesCenterY.constant = 0.0
                        self.view.layoutIfNeeded()
        },
                       completion: { _ in
                        self.animationsDidComplete()

                        // Voiceover: Set the initial content.
                        UIAccessibility.post(notification: .screenChanged,
                                             argument: self.leftSquareBracket)
        })
    }

    // MARK:- Private

    private var appendWithSprinkles: [UIView] = []
    private var commaAndIndex: [UIView] = []

}

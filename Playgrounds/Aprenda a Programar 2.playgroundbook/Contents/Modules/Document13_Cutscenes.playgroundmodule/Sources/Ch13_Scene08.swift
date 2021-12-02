//
//  Ch13_Scene08.swift
//
//  Copyright © 2020 Apple, Inc. All rights reserved.
//

import UIKit
import SPCCutsceneSupport

@objc(Ch13_Scene08)
class Ch13_Scene08: SceneViewController {

    @IBOutlet weak var primaryTextLabel: UILabel!

    @IBOutlet weak var appendLabel: UILabel!
    @IBOutlet weak var appendLabelTop: NSLayoutConstraint!
    @IBOutlet weak var sprinklesAsArgument: UIImageView!

    @IBOutlet weak var insertLabel: UILabel!
    @IBOutlet weak var strawberryAsArgument: UIImageView!

    @IBOutlet weak var fifthIndex: UILabel!
    @IBOutlet weak var firstCommaLeading: NSLayoutConstraint!

    @IBOutlet weak var strawberry: UIImageView!
    @IBOutlet weak var strawberryCenterY: NSLayoutConstraint!

    @IBOutlet weak var calloutLabel: UILabel!
    @IBOutlet weak var calloutBubble: UIView!
    @IBOutlet weak var calloutPointer: SPCTriangleView!

    @IBOutlet weak var icecream: UIImageView!
    @IBOutlet weak var cherries: UIImageView!
    @IBOutlet weak var sprinkles: UIImageView!
    @IBOutlet weak var banana: UIImageView!

    // MARK:-

    override func viewDidLoad() {
        super.viewDidLoad()

        shouldFadeIn = false

        primaryTextLabel.setAttributedText(xmlAnnotatedString:
            NSLocalizedString("In Swift, arrays come with <b>methods</b> that you can call to perform simple actions, such as removing or adding items.", comment: "primary text"))

        calloutLabel.text = NSLocalizedString("When you add or remove an item from an array, the index of every item after it changes.", comment: "callout text")

        appendWithSprinkles = [
            appendLabel,
            sprinklesAsArgument
        ]

        insertWithStrawberry = [
            insertLabel,
            strawberryAsArgument
        ]

        calloutElements = [
            calloutLabel,
            calloutBubble,
            calloutPointer
        ]

        // Make the callout pointer point down.
        calloutPointer.rotate(degrees: 180)

        // These elements are invisible at the start of the scene.
        calloutElements.forEach { $0.alpha = 0.0 }
        insertWithStrawberry.forEach { $0.alpha = 0.0 }
        fifthIndex.alpha = 0.0
        strawberry.alpha = 0.0

        // Voiceover: Provide descriptions for the images.
        icecream.makeAccessible(label: NSLocalizedString("a quart of ice cream, at index 0", comment: "accessibility label"))
        strawberry.makeAccessible(label: NSLocalizedString("a strawberry, at index 1", comment: "accessibility label"))
        banana.makeAccessible(label: NSLocalizedString("a banana, at index 2", comment: "accessibility label"))
        cherries.makeAccessible(label: NSLocalizedString("cherries, at index 3", comment: "accessibility label"))
        sprinkles.makeAccessible(label: NSLocalizedString("sprinkles, at index 4", comment: "accessibility label"))

        // Voiceover: Annotate the code label to better describe the scene.
        let localizedStrawberry = NSLocalizedString("a strawberry", comment: "accessibility label")
        insertLabel.accessibilityLabel = "ingredients.insert( \(localizedStrawberry), at: 1 ) " +
            NSLocalizedString("The strawberry was added to the array when this code was executed.", comment: "accessibility label")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Drop out the append method call.
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [],
                       animations: {
                        self.appendWithSprinkles.forEach { $0.alpha = 0.0 }
                        self.appendLabelTop.constant += 768.0
                        self.view.layoutIfNeeded()
        })

        // Fade in the insert method call.
        UIView.animate(withDuration: 0.5, delay: 0.7, options: [],
                       animations: {
                        self.insertWithStrawberry.forEach { $0.alpha = 1.0 }
        })

        // Expand the array.
        UIView.animate(withDuration: 0.5, delay: 1.7, options: [],
                       animations: {
                        self.firstCommaLeading.constant = 68.0
                        self.view.layoutIfNeeded()
        })
        UIView.animate(withDuration: 0.2, delay: 2.0, options: [],
                       animations: {
                        self.fifthIndex.alpha = 1.0
        })

        // Drop in the item.
        UIView.animate(withDuration: 0.2, delay: 2.4, options: [],
                       animations: {
                        self.strawberry.alpha = 1.0

                        self.strawberryCenterY.constant = 0.0
                        self.view.layoutIfNeeded()
        })

        // Show the callout.
        UIView.animate(withDuration: 0.4, delay: 3.0, options: [],
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
    
    private var appendWithSprinkles: [UIView] = []
    private var insertWithStrawberry: [UIView] = []
    private var calloutElements: [UIView] = []

}

//
//  Ch13_Scene06.swift
//
//  Copyright © 2020 Apple, Inc. All rights reserved.
//

import UIKit
import SPCCutsceneSupport

@objc(Ch13_Scene06)
class Ch13_Scene06: SceneViewController {

    @IBOutlet weak var primaryTextLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!

    @IBOutlet weak var itemAtTwo: UIImageView!
    @IBOutlet weak var secondItemCenterY: NSLayoutConstraint!

    @IBOutlet weak var thirdCommaLeading: NSLayoutConstraint!
    @IBOutlet weak var fourthIndex: UILabel!

    @IBOutlet weak var icecream: UIImageView!
    @IBOutlet weak var banana: UIImageView!
    @IBOutlet weak var cherries: UIImageView!
    
    // MARK:-

    override func viewDidLoad() {
        super.viewDidLoad()

        shouldFadeOut = false

        primaryTextLabel.setAttributedText(xmlAnnotatedString:
            NSLocalizedString("In Swift, arrays come with <b>methods</b> that you can call to perform simple actions, such as removing or adding items.", comment: "primary text"))

        // These elements are invisible at the start of the scene.
        codeLabel.alpha = 0.0

        // Voiceover: Provide descriptions for the images.
         icecream.makeAccessible(label: NSLocalizedString("a quart of ice cream, at index 0", comment: "accessibility label"))
         banana.makeAccessible(label: NSLocalizedString("a banana, at index 1", comment: "accessibility label"))
         cherries.makeAccessible(label: NSLocalizedString("cherries, at index 2", comment: "accessibility label"))

        // Voiceover: Annotate the code label to better describe the scene.
        codeLabel.accessibilityLabel = "ingredients.remove( at: 2 ) " +
            NSLocalizedString("The chocolate was removed from the array when this code was executed.", comment: "accessibility label")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Fade in the method call.
        UIView.animate(withDuration: 0.4, delay: 1.5, options: [],
                       animations: {
                        self.codeLabel.alpha = 1.0
        })

        // Remove the item at 2.
        UIView.animate(withDuration: 0.6, delay: 2.1, options: [],
                       animations: {
                        self.itemAtTwo.alpha = 0.0
                        self.secondItemCenterY.constant += 500.0
                        self.view.layoutIfNeeded()
        })

        // Shrink the array.
        UIView.animate(withDuration: 0.6, delay: 2.5, options: [],
                       animations: {
                        self.thirdCommaLeading.constant = 0.0
                        self.view.layoutIfNeeded()
        })
        UIView.animate(withDuration: 0.3, delay: 2.8, options: [],
                       animations: {
                        self.fourthIndex.alpha = 0.0
        },
                       completion: { _ in
                        self.animationsDidComplete()

                        // Voiceover: Set the initial content.
                        UIAccessibility.post(notification: .screenChanged,
                                             argument: self.primaryTextLabel)
        })
    }
    

}

//
//  Ch13_Scene03.swift
//
//  Copyright © 2020 Apple, Inc. All rights reserved.
//

import UIKit
import SPCCutsceneSupport

@objc(Ch13_Scene03)
class Ch13_Scene03: SceneViewController {

    @IBOutlet weak var primaryTextLabel: UILabel!

    @IBOutlet weak var calloutLabel: UILabel!
    @IBOutlet weak var calloutBubble: UIView!

    @IBOutlet weak var icecream: UIImageView!
    @IBOutlet weak var banana: UIImageView!
    @IBOutlet weak var chocolate: UIImageView!
    @IBOutlet weak var cherries: UIImageView!
    
    // MARK:-

    override func viewDidLoad() {
        super.viewDidLoad()

        primaryTextLabel.setAttributedText(xmlAnnotatedString:
            NSLocalizedString("Defining each ingredient as a constant is really repetitive. Instead, use an <b>array</b> to create a list of items in a certain order.", comment: "primary text"))

        calloutLabel.text = NSLocalizedString("Define an array by placing items of the same type inside square brackets, with each item separated by a comma.", comment: "callout text; describes an array")

        calloutElements = [
            calloutLabel,
            calloutBubble
        ]

        // These elements are invisible at the start of the scene.
        calloutElements.forEach { $0.alpha = 0.0 }

        // Voiceover: Provide descriptions for the images.
        icecream.makeAccessible(label: NSLocalizedString("a quart of ice cream", comment: "accessibility label"))
        banana.makeAccessible(label: NSLocalizedString("a banana", comment: "accessibility label"))
        chocolate.makeAccessible(label: NSLocalizedString("chocolate", comment: "accessibility label"))
        cherries.makeAccessible(label: NSLocalizedString("cherries", comment: "accessibility label"))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Fade in the callout.
        UIView.animate(withDuration: 0.3, delay: 1.0, options: [],
                       animations: {
                        self.calloutElements.forEach { $0.alpha = 1.0 }
        },
                       completion: { _ in
                        self.animationsDidComplete()

                        // Voiceover: Set the initial content.
                        UIAccessibility.post(notification: .screenChanged,
                                             argument: self.primaryTextLabel)
        })
    }
    
    // MARK:- Private

    private var calloutElements: [UIView] = []
}

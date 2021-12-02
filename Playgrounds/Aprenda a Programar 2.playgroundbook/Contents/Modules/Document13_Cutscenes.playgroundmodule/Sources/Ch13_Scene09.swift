//
//  Ch13_Scene09.swift
//
//  Copyright © 2020 Apple, Inc. All rights reserved.
//

import UIKit
import SPCCutsceneSupport

@objc(Ch13_Scene09)
class Ch13_Scene09: SceneViewController {

    @IBOutlet weak var primaryTextLabel: UILabel!
    
    @IBOutlet weak var icecream: UIImageView!
    @IBOutlet weak var cherries: UIImageView!
    @IBOutlet weak var sprinkles: UIImageView!
    @IBOutlet weak var banana: UIImageView!
    @IBOutlet weak var chocolate: UIImageView!
    @IBOutlet weak var bowl: UIImageView!

    // MARK:-

    override func viewDidLoad() {
        super.viewDidLoad()

        shouldFadeOut = false

        primaryTextLabel.setAttributedText(xmlAnnotatedString:
            NSLocalizedString("You can perform the same action on each item in an array, a process known as <b>iteration</b>.", comment: "primary text"))

        // Voiceover: Provide descriptions for the images.
        icecream.makeAccessible(label: NSLocalizedString("a quart of ice cream, at index 0", comment: "accessibility label"))
        banana.makeAccessible(label: NSLocalizedString("a banana, at index 1", comment: "accessibility label"))
        chocolate.makeAccessible(label: NSLocalizedString("chocolate, at index 2", comment: "accessibility label"))
        sprinkles.makeAccessible(label: NSLocalizedString("sprinkles, at index 3", comment: "accessibility label"))
        cherries.makeAccessible(label: NSLocalizedString("cherries, at index 4", comment: "accessibility label"))
        bowl.makeAccessible(label: NSLocalizedString("a glass sundae dish", comment: "accessibility label"))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.animationsDidComplete()

        // Voiceover: Set the initial content.
        UIAccessibility.post(notification: .screenChanged,
                             argument: self.primaryTextLabel)
    }

}

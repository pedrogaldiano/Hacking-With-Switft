//
//  Ch12_Scene02.swift
//
//  Copyright © 2020 Apple, Inc. All rights reserved.
//

import UIKit
import SPCCutsceneSupport

@objc(Ch12_Scene02)
class Ch12_Scene02: SceneViewController {

    @IBOutlet weak var primaryTextLabel: UILabel!
    @IBOutlet weak var primaryTextTop: NSLayoutConstraint!

    @IBOutlet weak var secondaryTextLabel: UILabel!

    @IBOutlet weak var island: UIImageView!

    // MARK:-

    override func viewDidLoad() {
        super.viewDidLoad()

        shouldFadeOut = false

        primaryTextLabel.text = NSLocalizedString("With code, you can transform the world around you.", comment: "primary text")

        secondaryTextLabel.text = NSLocalizedString("You just describe what to build and where to build it.", comment: "secondary text")
        secondaryTextLabel.alpha = 0.0

        // Voiceover: Describe the graphic elements.
        island.makeAccessible(label: NSLocalizedString("A grassy island, floating in the air.", comment: "accessibility label"))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Drop in the primary text, with bounce.
        animateChange(to: primaryTextTop, value: 92.0, duration: 0.5, delay: 0.3)

        // Fade in the secondary text, after a delay.
        UIView.animate(withDuration: 0.5, delay: 1.5, options: [],
                       animations: {
                        self.secondaryTextLabel.alpha = 1.0
        },
                       completion: { _ in
                        self.animationsDidComplete()

                        // Voiceover: Set the initial content.
                        UIAccessibility.post(notification: .screenChanged,
                                             argument: self.primaryTextLabel)
        })
    }
}

//
//  Ch12_Scene01.swift
//
//  Copyright © 2020 Apple, Inc. All rights reserved.
//

import UIKit
import SPCCutsceneSupport

@objc(Ch12_Scene01)
class Ch12_Scene01: SceneViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    @IBOutlet weak var leftHairlineTop: NSLayoutConstraint!
    @IBOutlet weak var rightHairlineTop: NSLayoutConstraint!

    @IBOutlet weak var blockTop: NSLayoutConstraint!
    @IBOutlet weak var gemBottom: NSLayoutConstraint!

    // MARK:-

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = NSLocalizedString("World Building", comment: "title text; the title of this chapter")

        subtitleLabel.text = NSLocalizedString("It’s your world", comment: "subtitle; describes the chapter")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        UIView.animate(withDuration: 0.6, delay: 0.3, options: [],
                       animations: {
                        self.leftHairlineTop.constant += self.hairlineVerticalDrop
                        self.rightHairlineTop.constant += self.hairlineVerticalDrop
                        self.view.layoutIfNeeded()
        })

        animateChange(to: gemBottom, value: -78.0, duration: 0.3, delay: 0.6)
        animateChange(to: blockTop, value: -84.0, duration: 0.3, delay: 0.6,
                      then: {
                        self.animationsDidComplete()
        })

        // Voiceover: Set the initial content.
        UIAccessibility.post(notification: .screenChanged,
                             argument: self.titleLabel)
    }

    // MARK: - Private

    private let hairlineVerticalDrop: CGFloat = 65.0
}

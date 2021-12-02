//
//  Ch13_Scene01.swift
//
//  Copyright © 2020 Apple, Inc. All rights reserved.
//

import UIKit
import SPCCutsceneSupport

@objc(Ch13_Scene01)
class Ch13_Scene01: SceneViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    @IBOutlet weak var leftHairlineTop: NSLayoutConstraint!
    @IBOutlet weak var rightHairlineTop: NSLayoutConstraint!

    // MARK:-

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = NSLocalizedString("Arrays", comment: "title text; title of this chapter")

        subtitleLabel.text = NSLocalizedString("Ordered lists", comment: "subtitle; describes the chapter title")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        UIView.animate(withDuration: 0.5, delay: 0.3, options: [],
                       animations: {
                        self.leftHairlineTop.constant += self.hairlineVertical
                        self.rightHairlineTop.constant += self.hairlineVertical
                        self.view.layoutIfNeeded()
        },
                       completion: { _ in
                        self.animationsDidComplete()
        })

        // Voiceover: Set the initial content.
        UIAccessibility.post(notification: .screenChanged,
                             argument: self.titleLabel)
    }

    // MARK:- Private

    private var hairlineVertical: CGFloat = 65.0

}

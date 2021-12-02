//
//  Ch08_Scene01.swift
//
//  Copyright © 2020 Apple, Inc. All rights reserved.
//

import UIKit
import SPCCutsceneSupport

@objc(Ch08_Scene01)
class Ch08_Scene01: SceneViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    @IBOutlet weak var leftHairline: UIView!
    @IBOutlet weak var rightHairline: UIView!
    @IBOutlet weak var leftHairlineTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightHairlineTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftHairlineCenterXConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightHairlineCenterXConstraint: NSLayoutConstraint!

    @IBOutlet weak var circleView: SPCCircleView!
    @IBOutlet weak var circleLabel: UILabel!
    @IBOutlet weak var circleViewCenterYConstraint: NSLayoutConstraint!

    // MARK:-

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = NSLocalizedString("Learn to Code 2", comment: "title text; the title of this playground book")
        
        subtitleLabel.text = NSLocalizedString("Variables", comment: "subtitle text; the title of this chapter")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Drop the hairline views into place.
        UIView.animate(withDuration: 0.5) {
            self.leftHairlineTopConstraint.constant += self.hairlineVertical
            self.rightHairlineTopConstraint.constant += self.hairlineVertical
            self.view.layoutIfNeeded()
        }

        UIView.animate(withDuration: 0.6, delay: 0.8, options: [],
                       animations: {
                        // Spread the hairline views apart.
                        self.leftHairlineCenterXConstraint.constant -= self.hairlineHorizontal
                        self.rightHairlineCenterXConstraint.constant += self.hairlineHorizontal

                        // Bring the circle view up into the center of the hairline views.
                        self.view.removeConstraint(self.circleViewCenterYConstraint)
                        NSLayoutConstraint.activate([
                            self.circleView.centerYAnchor.constraint(equalTo: self.leftHairline.centerYAnchor)
                        ])

                        self.view.layoutIfNeeded()
        })

        // Approximate flipping the circle view over by squashing it, then changing content and color.
        UIView.animate(withDuration: 0.2, delay: 1.4, options: [],
                       animations: {
                        self.circleView.transform = self.circleView.transform.scaledBy(x: 1.0, y: 0.0833)
                        self.circleLabel.alpha = 0.0
        },
                       completion: { _ in
                        self.circleView.backgroundColor = UIColor(named: "LTC2_Circle_Grey")!
                        self.circleLabel.text = "E"

                        UIView.animate(withDuration: 0.2,
                                       animations: {
                                        self.circleView.transform = self.circleView.transform.scaledBy(x: 1.0, y: 12.0)
                                        self.circleLabel.alpha = 1.0
                        },
                                       completion: { _ in
                                        // Signal that we have finished all animations.
                                        self.animationsDidComplete()
                        })
        })

        // Voiceover: Set the initial content.
        UIAccessibility.post(notification: .screenChanged, argument: titleLabel)
    }

    // MARK: - Private

    private let hairlineVertical: CGFloat = 65.0
    private let hairlineHorizontal: CGFloat = 48.0
}

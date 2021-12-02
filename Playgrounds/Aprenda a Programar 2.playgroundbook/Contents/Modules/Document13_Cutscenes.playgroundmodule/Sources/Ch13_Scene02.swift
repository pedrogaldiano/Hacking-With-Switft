//
//  Ch13_Scene02.swift
//
//  Copyright © 2020 Apple, Inc. All rights reserved.
//

import UIKit
import SPCCutsceneSupport

@objc(Ch13_Scene02)
class Ch13_Scene02: SceneViewController {

    @IBOutlet weak var primaryTextLabel: UILabel!
    @IBOutlet weak var secondaryTextLabel: UILabel!

    @IBOutlet weak var firstIngredientTop: NSLayoutConstraint!
    @IBOutlet weak var secondIngredientTop: NSLayoutConstraint!
    @IBOutlet weak var thirdIngredientTop: NSLayoutConstraint!
    @IBOutlet weak var fourthIngredientTop: NSLayoutConstraint!

    @IBOutlet weak var icecream: UIImageView!
    @IBOutlet weak var banana: UIImageView!
    @IBOutlet weak var chocolate: UIImageView!
    @IBOutlet weak var cherries: UIImageView!

    @IBOutlet weak var sundae: UIImageView!

    // MARK:-

    override func viewDidLoad() {
        super.viewDidLoad()

        primaryTextLabel.text = NSLocalizedString("Imagine you’re making an ice cream sundae.", comment: "primary text")

        secondaryTextLabel.text = NSLocalizedString("First, think of your ingredients in the order\nyou’d place them in the bowl:", comment: "secondary text")

        // These elements are invisible at the start of the scene.
        icecream.alpha = 0.0
        banana.alpha = 0.0
        chocolate.alpha = 0.0
        cherries.alpha = 0.0

        // Voiceover: Provide descriptions for the images.
        sundae.makeAccessible(label: NSLocalizedString("an ice cream sundae", comment: "accessibility label"))
        icecream.makeAccessible(label: NSLocalizedString("a quart of ice cream", comment: "accessibility label"))
        banana.makeAccessible(label: NSLocalizedString("a banana", comment: "accessibility label"))
        chocolate.makeAccessible(label: NSLocalizedString("chocolate", comment: "accessibility label"))
        cherries.makeAccessible(label: NSLocalizedString("cherries", comment: "accessibility label"))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Move in the first variable declaration.
        UIView.animate(withDuration: 0.5, delay: 1.0, options: [],
                       animations: {
                        self.firstIngredientTop.constant = 24.0
                        self.view.layoutIfNeeded()
        })
        // Fade in the first ingredient.
        UIView.animate(withDuration: 0.3, delay: 1.5, options: [],
                       animations: {
                        self.icecream.alpha = 1.0
        })
        // Move in the second variable declaration.
        UIView.animate(withDuration: 0.5, delay: 2.0, options: [],
                       animations: {
                        self.secondIngredientTop.constant = 12.0
                        self.view.layoutIfNeeded()
        })
        // Fade in the second ingredient.
        UIView.animate(withDuration: 0.3, delay: 2.5, options: [],
                       animations: {
                        self.banana.alpha = 1.0
        })
        // Move in the third variable declaration.
        UIView.animate(withDuration: 0.5, delay: 3.0, options: [],
                       animations: {
                        self.thirdIngredientTop.constant = 12.0
                        self.view.layoutIfNeeded()
        })
        // Fade in the third ingredient.
        UIView.animate(withDuration: 0.3, delay: 3.5, options: [],
                       animations: {
                        self.chocolate.alpha = 1.0
        })
        // Move in the fourth variable declaration.
        UIView.animate(withDuration: 0.5, delay: 4.0, options: [],
                       animations: {
                        self.fourthIngredientTop.constant = 12.0
                        self.view.layoutIfNeeded()
        })
        // Fade in the fourth ingredient.
        UIView.animate(withDuration: 0.3, delay: 4.5, options: [],
                       animations: {
                        self.cherries.alpha = 1.0
        },
                       completion: { _ in
                        self.animationsDidComplete()

                        // Voiceover: Set the initial content.
                        UIAccessibility.post(notification: .screenChanged,
                                             argument: self.primaryTextLabel)
        })
    }
}

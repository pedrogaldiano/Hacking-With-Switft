//
//  GoalCounter.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//

import UIKit

class GoalCounter: UIImageView {
    // MARK: Counter Properties
    
    var gemCount = 0 {
        didSet {
            guard oldValue != gemCount else { return }
            DispatchQueue.main.async {
                self.updateLabels()
                if self.gemCount == self.totalGemCount {
                    self.animateTextPop(label: self.gemLabel)
                }
            }
        }
    }
    
    var totalGemCount = 0 {
        didSet {
            updateLabels()
        }
    }
    
    var switchCount = 0 {
        didSet {
            guard oldValue != switchCount else { return }
            DispatchQueue.main.async {
                self.updateLabels()
                if self.switchCount == self.totalSwitchCount {
                    self.animateTextPop(label: self.switchLabel)
                }
            }
        }
    }
    
    var totalSwitchCount = 0 {
        didSet {            
            updateLabels()
        }
    }
    
    // MARK: Views Properties
    
    let gemContainer = UIStackView()
    let gemLabel = UILabel()
    
    var switchXConstraint = NSLayoutConstraint()
    let switchContainer = UIStackView()
    let switchLabel = UILabel()
    
    let interCounterPadding: CGFloat = 10
    let imageLabelSpacing: CGFloat = 5
    let containerMarginOffset: CGFloat = 25
    let imageToLabelRatio: CGFloat = 0.6
    
    let font = UIFont(name: "Avenir-Black", size: 18)!
    
    lazy var minimumLabelWidth: CGFloat = self.labelWidth(for: "9/9")
    lazy var mediumLabelWidth: CGFloat = self.labelWidth(for:  "9/99")
    lazy var maxiumLabelWidth: CGFloat = self.labelWidth(for: "99/99")
    
    // MARK: Initialization
    
    init() {
        super.init(image: nil)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        self.image = UIImage(named: "Board")
        isAccessibilityElement = true
        accessibilityTraits = .summaryElement
        
        // Set images
        let gemImageView = UIImageView(image: UIImage(named: "GemCount"))
        let switchImageView = UIImageView(image: UIImage(named: "SwitchCount"))
        let centerImageView = UIImageView(image: UIImage(named: "BoardRope"))
        
        addSubview(centerImageView)
        centerImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // *Gem Container*
        addSubview(gemContainer)
        gemContainer.translatesAutoresizingMaskIntoConstraints = false
        arrange(image: gemImageView, label: gemLabel, in: gemContainer)
        
        // *Switch Container*
        insertSubview(switchContainer, belowSubview: gemContainer)
        switchContainer.translatesAutoresizingMaskIntoConstraints = false
        switchXConstraint = switchContainer.leadingAnchor.constraint(equalTo: leadingAnchor)
        switchXConstraint.priority = UILayoutPriority.defaultHigh
        arrange(image: switchImageView, label: switchLabel, in: switchContainer)
        
        let gemTrailing = gemContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -containerMarginOffset)
        gemTrailing.priority = UILayoutPriority.defaultLow
        
        NSLayoutConstraint.activate([
            centerImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            centerImageView.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            
            gemContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: containerMarginOffset),
            gemContainer.centerYAnchor.constraint(equalTo: centerYAnchor),
            gemContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.65),
            gemTrailing,
            
            switchXConstraint,
            switchContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -containerMarginOffset),
            switchContainer.centerYAnchor.constraint(equalTo: centerYAnchor),
            switchContainer.heightAnchor.constraint(equalTo: gemContainer.heightAnchor),
        ])
        
        // Hide the view until the labels are populated.
        isHidden = true
        alpha = 0
        switchContainer.alpha = 0
        gemContainer.alpha = 0
        
        updateLabels()
    }
    
    func arrange(image: UIImageView, label: UILabel, in container: UIStackView) {
        image.contentMode = .scaleAspectFit
        container.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        
        label.baselineAdjustment = .alignCenters
        container.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraint = label.widthAnchor.constraint(equalToConstant: minimumLabelWidth)
        widthConstraint.identifier = ConstraintIdentifier.width.rawValue
        
        NSLayoutConstraint.activate([
            widthConstraint,
            image.widthAnchor.constraint(equalTo: image.heightAnchor),
        ])
        
        container.axis = .horizontal
        container.distribution = .fill
        container.spacing = imageLabelSpacing
        container.addArrangedSubview(image)
        container.addArrangedSubview(label)
    }
    
    // MARK: Updating
    
    func updateLabels() {
        let gemText = "\(self.gemCount)/\(self.totalGemCount)"
        self.gemLabel.attributedText = self.makeStylizedString(for: gemText)
        
        let switchText = "\(self.switchCount)/\(self.totalSwitchCount)"
        self.switchLabel.attributedText = self.makeStylizedString(for: switchText)

        let noGems = self.totalGemCount <= 0
        let noSwitches = self.totalSwitchCount <= 0
        
        self.isHidden = noGems && noSwitches
        self.layoutIfNeeded()
        
        if noGems || noSwitches {
            // Left align the content.
            self.switchXConstraint.constant = self.containerMarginOffset
        }
        else {
            // Display both counters.
            self.switchXConstraint.constant = self.gemContainer.frame.width + self.interCounterPadding + self.containerMarginOffset
        }
        
        self.gemLabel.widthConstraint?.constant = self.widthForLabel(self.gemLabel)
        self.switchLabel.widthConstraint?.constant = self.widthForLabel(self.switchLabel)
        
        UIView.animate(withDuration: 0.5) {
            self.layoutIfNeeded()
            
            // Hide the view if there are no goals.
            self.alpha = noGems && noSwitches ? 0 : 1
            
            self.gemContainer.alpha = noGems ? 0 : 1
            self.switchContainer.alpha = noSwitches ? 0 : 1
        }
    }
    
    func makeStylizedString(for text: String) -> NSAttributedString {
        let str = NSMutableAttributedString(string: text)
        let slashIndex = NSString(string: text).range(of: "/").location
        guard slashIndex != NSNotFound else { return NSAttributedString() }
        
        let leadingRange = NSRange(location: 0, length: slashIndex)
        let leadingAttributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        str.addAttributes(leadingAttributes, range: leadingRange)
        
        let trailingRange = NSRange(location: slashIndex, length: text.count - slashIndex)
        let trailingAttributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: UIColor(red:0.87, green:0.72, blue:0.46, alpha:1.0)
        ]
        str.addAttributes(trailingAttributes, range: trailingRange)

        return str
    }
    
    func animateTextPop(label: UILabel) {
        let scale = WorldConfiguration.Scene.counterPopScale
        
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3) {
                label.transform = label.transform.scaledBy(x: scale, y: scale)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.3) {
                label.transform = label.transform.scaledBy(x: 1 / scale, y: 1 / scale)
            }
        })
    }
    
    // MARK: Helper
    
    func widthForLabel(_ label: UILabel) -> CGFloat {
        let textWidth = labelWidth(for: label.text ?? "")
        
        if textWidth > mediumLabelWidth {
            return maxiumLabelWidth
        }
        else if textWidth > minimumLabelWidth {
            return mediumLabelWidth
        }
        else {
            return minimumLabelWidth
        }
    }
    
    func labelWidth(for text: String) -> CGFloat {
        let fontAttributes = [
            NSAttributedString.Key.font: self.font
        ]
        let fractionalWidth = NSAttributedString(string: text, attributes: fontAttributes).size().width
        
        return ceil(fractionalWidth)
    }
}

extension UIView {
    enum ConstraintIdentifier: String {
        case width
    }
    
    var widthConstraint: NSLayoutConstraint? {
        return constraints.first {
            $0.identifier == ConstraintIdentifier.width.rawValue
        }
    }
}

extension GoalCounter {
    // MARK: Accessibility
    
    override var accessibilityLabel: String? {
        get {
            var gemDesc = ""
            if totalGemCount > 0 {
                let format = NSLocalizedString("sd:gems_collected.%lu out of %lu gems collected. ", comment: "gems_collected {number of collected gems} {number of total gems}")
                gemDesc = String.localizedStringWithFormat(format, gemCount, totalGemCount)
            }
            
            var switchDesc = ""
            if totalSwitchCount > 0 {
                let format = NSLocalizedString("sd:switches_opened.%lu out of %lu switches opened.", comment: "switches_opened {number of open switches} {number of total switches}")
                switchDesc = String.localizedStringWithFormat(format, switchCount, totalSwitchCount)
            }
            
            return NSLocalizedString("Goal count: ", comment: "Describes the number of goals in the game. + {gems_collected} + {switches_opened}") + gemDesc + switchDesc
        }
        set {}
    }
}

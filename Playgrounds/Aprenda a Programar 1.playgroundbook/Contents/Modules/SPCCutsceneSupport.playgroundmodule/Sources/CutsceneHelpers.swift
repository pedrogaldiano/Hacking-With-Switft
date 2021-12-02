//
//  CutsceneHelpers.swift
//  
//  Copyright © 2016-2020 Apple Inc. All rights reserved.
//

import UIKit

public func deg2Rad(_ degrees: CGFloat) -> CGFloat {
    return CGFloat.pi * degrees/180
}

public extension CGAffineTransform {
    var rotationAngle: CGFloat {
        return atan2(b, a) * 180 / CGFloat.pi
    }
    
    var scaleX: CGFloat {
        return sqrt(a * a + c * c)
    }
    
    var scaleY: CGFloat {
        return sqrt(b * b + d * d)
    }
}

public extension UIImage {
    func scaledToFit(within availableSize: CGSize) -> UIImage {
        var scaledImageRect = CGRect.zero
        
        let aspectWidth = availableSize.width / self.size.width
        let aspectHeight = availableSize.height / self.size.height
        let aspectRatio = min(aspectWidth, aspectHeight)
        
        scaledImageRect.size.width = self.size.width * aspectRatio
        scaledImageRect.size.height = self.size.height * aspectRatio
        
        let rendererFormat = UIGraphicsImageRendererFormat.preferred()
        
        let renderer = UIGraphicsImageRenderer(size: scaledImageRect.size, format: rendererFormat)
        let scaledImage = renderer.image { _ in
            self.draw(in: scaledImageRect)
        }
        return scaledImage
    }
}

public extension UIView {

    // MARK: Animation

    /// An animation helper, intended to be used to UIView keyframe animation.
    ///
    /// - Parameter totalFrames: The total number of frames in the animation sequence.
    ///
    /// - Returns: A closure which takes the starting and ending frames for a given
    ///            set of animations, and a closure with the animations themselves,
    ///            to compute the relative start and relative duration, then
    ///            add the animations to the current animation context.

    @objc static func keyframeAnimator(totalFrames: Double) -> ((Double, Double, @escaping () -> Void) -> Void) {
        let animateFrames: (Double, Double, @escaping () -> Void) -> Void = { start, end, animations in
            UIView.addKeyframe(withRelativeStartTime: start / totalFrames,
                               relativeDuration: (end - start) / totalFrames,
                               animations: animations)
        }
        return animateFrames
    }

    /// Animate the size of the view to its full size, with a pop.
    ///
    /// This is intended to be called to bring the view into a scene,
    /// after the view has been hidden using `shrinkToInvisible()`.
    ///
    /// - Parameter duration: The intended duration (seconds) of the animation.
    /// - Parameter delay: The delay (seconds) before this animation is to begin.

    @objc func animateToFullSizeWithPop(duration: TimeInterval, delay: TimeInterval) {

        let maxScale: CGFloat = 1.25
        let normalScale: CGFloat = 1.0
        UIView.animate(withDuration: (0.7 * duration), delay: delay, options: [],
                       animations: {
                        self.transform = CGAffineTransform(scaleX: maxScale, y: maxScale)
        },
                       completion: { _ in
                        UIView.animate(withDuration: (0.3 * duration)) {
                            self.transform = CGAffineTransform(scaleX: normalScale, y: normalScale)
                        }
        })
    }

    // MARK: Accessibility

    /// A convenience function to set the accessibility info on a view.
    ///
    /// Only the label parameter is required. isAccessibilityElement will always be set to true.
    /// If no traits are provided, the default is to treat this view as an image.
    ///
    /// - Parameter label: a localized string which will be used as the assessibilityLabel
    /// - Parameter traits: a sequence of traits which describe the role of this view

    @objc func makeAccessible(label: String, traits: UIAccessibilityTraits = [.image]) {

        self.isAccessibilityElement = true
        self.accessibilityLabel = label
        self.accessibilityTraits = traits
    }

    // MARK: Transforms

    /// A convenience method used to hide the view, before introducing it
    /// into a scene using `animateToFullSizeWithPop(duration:delay:)`.

    @objc func shrinkToInvisible() {

        let zeroScale: CGFloat = 0.0
        self.transform = CGAffineTransform(scaleX: zeroScale, y: zeroScale)
    }

    /// A convenience method used to scale the view by the same amount in
    /// both the x and y axes.
    ///
    /// - Parameter factor: the scaling factor to be used, from 0.0 to 1.0

    @objc func scale(by factor: CGFloat) {

        self.transform = self.transform.scaledBy(x: factor, y: factor)
    }

    /// A convenience method used to translate the view by the specified points.
    ///
    /// - Parameter xOffset: a positive or negative offset for the x axis
    /// - Parameter yOffset: a positive or negative offset for the y axis

    @objc func translate(xOffset: CGFloat = 0, yOffset: CGFloat = 0) {

        self.transform = self.transform.translatedBy(x: xOffset, y: yOffset)
    }

    /// A convenience method used to rotate the view by the specified number of degrees.
    ///
    /// - Parameter degrees: a positive or negative number of degrees

    @objc func rotate(degrees: CGFloat) {

        self.transform = self.transform.rotated(by: deg2Rad(degrees))
    }

    /// A convenience function to set the anchor point for a view's transform operations.
    ///
    /// - Parameter anchorPoint: in unit coordinate space (0.0, 0.0) to (1.0, 1.0)

    @objc func setAnchorPoint(_ anchorPoint: CGPoint) {

        var newPoint = CGPoint(x: self.bounds.size.width * anchorPoint.x,
                               y: self.bounds.size.height * anchorPoint.y)

        var oldPoint = CGPoint(x: self.bounds.size.width * self.layer.anchorPoint.x,
                               y: self.bounds.size.height * self.layer.anchorPoint.y)

        newPoint = newPoint.applying(self.transform)
        oldPoint = oldPoint.applying(self.transform)

        var position = self.layer.position
        position.x -= oldPoint.x
        position.x += newPoint.x

        position.y -= oldPoint.y
        position.y += newPoint.y

        self.layer.position = position
        self.layer.anchorPoint = anchorPoint
    }
}

public extension UIViewController {

    /// A convenience function to embed a child controller, using layout constraints.
    ///
    /// - Parameter vc: the controller to embed.
    /// - Parameter below: a view from the parent controller's view hierarchy.

    func embedChildController(_ vc: UIViewController, below: UIView? = nil) {

        addChild(vc)

        vc.view.translatesAutoresizingMaskIntoConstraints = false

        if let otherView = below {
            view.insertSubview(vc.view, belowSubview: otherView)
        } else {
            view.addSubview(vc.view)
        }

        NSLayoutConstraint.activate([
            vc.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            vc.view.topAnchor.constraint(equalTo: view.topAnchor),
            vc.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            vc.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        vc.view.setNeedsLayout()
        vc.view.layoutIfNeeded()

        vc.didMove(toParent: self)
    }
}

// MARK:-

public extension UILabel {

    /// A convenience function to enable resizing of styled text.
    ///
    /// This function is needed because UILabel will not automatically resize your attributed text if you have set a font attribute.
    ///
    /// - Parameter unstyledFont: the font to use for ranges where no other font has been applied.

    func resizeAttributedText(unstyledFont: UIFont) {

        guard let attrText = self.attributedText else { return }

        let textRect: (UILabel) -> CGRect = { (label) in
            return label.textRect(forBounds: label.bounds, limitedToNumberOfLines: 0)
        }

        var fontSize = self.font.pointSize
        let mutable = NSMutableAttributedString(attributedString: attrText)

        while !self.bounds.contains(textRect(self)) {
            mutable.enumerateAttribute(.font, in: NSMakeRange(0, mutable.length), options: []) { (value, range, stop) in
                if let theFont = value as? UIFont {
                    fontSize = theFont.pointSize - 2
                    let newFont = UIFont(descriptor: theFont.fontDescriptor, size: fontSize)
                    mutable.setAttributes([.font : newFont], range: range)
                }
            }
            self.font = UIFont(descriptor: unstyledFont.fontDescriptor, size: fontSize)
            self.attributedText = mutable
        }
    }
}

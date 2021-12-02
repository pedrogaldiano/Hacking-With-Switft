//
//  UILabel+Cutscenes.swift
//
//  Copyright © 2020 Apple, Inc. All rights reserved.
//

import UIKit

public extension UILabel {

    func setAttributedText(xmlAnnotatedString: String) {

        var style = CutsceneAttributedStringStyle()
        style.fontSize = self.font.pointSize

        self.attributedText = NSAttributedString(textXML: xmlAnnotatedString, style: style)
    }
}

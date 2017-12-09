//
//  FontDescriptorExtension.swift
//  All My Demos
//
//  Created by Jimmy on 2017/12/6.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

import Foundation
import UIKit

extension UIFontDescriptor {
    @nonobjc static var fontSizeTable : [UIFontTextStyle : [UIContentSizeCategory : CGFloat]] = {
        return [
            .headline : [.accessibilityExtraExtraExtraLarge: 23,
                         .accessibilityExtraExtraLarge: 23,
                         .accessibilityExtraLarge: 23,
                         .accessibilityLarge: 23,
                         .accessibilityMedium: 23,
                         .extraExtraExtraLarge: 23,
                         .extraExtraLarge: 21,
                         .extraLarge: 19,
                         .large: 17,
                         .medium: 16,
                         .small: 15,
                         .extraSmall: 14],
            .body : [
                .accessibilityExtraExtraExtraLarge: 53,
                .accessibilityExtraExtraLarge: 47,
                .accessibilityExtraLarge: 40,
                .accessibilityLarge: 33,
                .accessibilityMedium: 28,
                .extraExtraExtraLarge: 23,
                .extraExtraLarge: 21,
                .extraLarge: 19,
                .large: 17,
                .medium: 16,
                .small: 15,
                .extraSmall: 14],
            .caption1: [
                .accessibilityExtraExtraExtraLarge: 18,
                .accessibilityExtraExtraLarge: 18,
                .accessibilityExtraLarge: 18,
                .accessibilityLarge: 18,
                .accessibilityMedium: 18,
                .extraExtraExtraLarge: 18,
                .extraExtraLarge: 16,
                .extraLarge: 14,
                .large: 12,
                .medium: 11,
                .small: 11,
                .extraSmall: 11],
            .caption2: [
                .accessibilityExtraExtraExtraLarge: 17,
                .accessibilityExtraExtraLarge: 17,
                .accessibilityExtraLarge: 17,
                .accessibilityLarge: 17,
                .accessibilityMedium: 17,
                .extraExtraExtraLarge: 17,
                .extraExtraLarge: 15,
                .extraLarge: 13,
                .large: 11,
                .medium: 11,
                .small: 11,
                .extraSmall: 11],
            .footnote: [
                .accessibilityExtraExtraExtraLarge: 19,
                .accessibilityExtraExtraLarge: 19,
                .accessibilityExtraLarge: 19,
                .accessibilityLarge: 19,
                .accessibilityMedium: 19,
                .extraExtraExtraLarge: 19,
                .extraExtraLarge: 17,
                .extraLarge: 15,
                .large: 13,
                .medium: 12,
                .small: 12,
                .extraSmall: 12],
        ]
    }()
    
    class func currentPreferredSize(textStyle: UIFontTextStyle = .body) -> CGFloat {
        let contentSize = UIApplication.shared.preferredContentSizeCategory
        guard let style = fontSizeTable[textStyle], let fontSize = style[contentSize] else { return 17 }
        return fontSize
    }
    
    class func christmasPreferredFontDescriptor(fontName: String = "Miraculous&Christmas", textStyle: UIFontTextStyle = .body) -> UIFontDescriptor {
        print("#function")
        return UIFontDescriptor(name: fontName, size: currentPreferredSize())
    }
}

//
//  FontExtension.swift
//  All My Demos
//
//  Created by Jimmy on 2017/12/7.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    func sizeOfString(_ str:String, constrainedToWidth width:CGFloat) -> CGSize {
        return (str as NSString).boundingRect(with: CGSize(width: width, height: .greatestFiniteMagnitude),
                                              options: .usesLineFragmentOrigin,
                                              attributes: ["NSAccessibilityFontTextAttribute":self],
                                              context: nil).size
    }
}

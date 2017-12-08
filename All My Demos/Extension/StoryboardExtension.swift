//
//  StoryboardExtension.swift
//  All My Demos
//
//  Created by Jimmy on 2017/12/2.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    enum StoryBoardIDEnum {
        case StringStoryBoard, WWDC
    }
    
    class func getStoryboardWithName(_ name:String) -> UIStoryboard? {
        return UIStoryboard(name: name, bundle: nil)
    }
    
}

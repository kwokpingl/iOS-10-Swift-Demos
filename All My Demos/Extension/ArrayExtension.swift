//
//  ArrayExtension.swift
//  All My Demos
//
//  Created by Jimmy on 2017/12/4.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

import Foundation
import UIKit

extension Array {
    func getObjectAtIndex(_ index:Int) -> Element? {
        if self.count > index {
            return self[index]
        }
        return nil
    }
}

//
//  RandomVC.swift
//  All My Demos
//
//  Created by Jimmy on 2017/12/4.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

import Foundation
import UIKit

class RandomVC : UIViewController {
    var random = Random()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        random = Random(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: 100))
        view.addSubview(random)
    }
    
}

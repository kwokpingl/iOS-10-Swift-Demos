//
//  InfiniteScrollVC.swift
//  All My Demos
//
//  Created by Jimmy on 2017/12/7.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

import Foundation
import UIKit

class InfiniteScrollVC: UIViewController {
    
    var infiniteScrollView = InfiniteScrollV()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let originY = UIApplication.shared.statusBarFrame.height + (navigationController?.navigationBar.frame.height ?? 0) + 5
        
        infiniteScrollView.frame = CGRect(x: 10, y: originY, width: view.frame.width - 20, height: view.frame.height - originY)
        
        view.addSubview(infiniteScrollView)
    }
}

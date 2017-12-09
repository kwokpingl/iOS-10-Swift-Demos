//
//  InfiniteScrollSubView.swift
//  All My Demos
//
//  Created by Jimmy on 2017/12/9.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

import Foundation
import UIKit

class InfiniteScrollSubView: UIView {
    
    static let maxHeight = 500
    static let minHeight = 50
    
    static let minWidth = 20
    static let maxWidth = 200
    
    class func randomBuildingView() -> InfiniteScrollSubView {
        
        let randomHeight = Int(arc4random_uniform(UInt32(InfiniteScrollSubView.maxHeight - InfiniteScrollSubView.minHeight + 1))) + InfiniteScrollSubView.minHeight
        
        let randomWidth = Int(arc4random_uniform(UInt32(InfiniteScrollSubView.maxWidth - minWidth + 1))) + InfiniteScrollSubView.minWidth
        
        let infiniteScrollSubView = InfiniteScrollSubView(frame: CGRect(x: 0, y: 0, width: CGFloat(randomWidth), height: CGFloat(randomHeight)))
        
        let randomR = Float(arc4random_uniform(256)).divided(by: 255)
        let randomG = Float(arc4random_uniform(256)).divided(by: 255)
        let randomB = Float(arc4random_uniform(256)).divided(by: 255)
        let randomAlpha = (Float(arc4random_uniform(100)) + 1.0).divided(by: 100)
        
        
        infiniteScrollSubView.backgroundColor = UIColor(colorLiteralRed: randomR, green: randomG, blue: randomB, alpha: randomAlpha)
        
        return infiniteScrollSubView
    }
    
    class func heightOfTallestBuilding() -> CGFloat {
        return CGFloat(InfiniteScrollSubView.maxHeight)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
}

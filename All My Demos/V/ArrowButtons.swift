//
//  ArrowButtons.swift
//  All My Demos
//
//  Created by Jimmy on 2017/12/4.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

import Foundation
import UIKit

class ArrowButtons:UIButton {
    
    static let padding:CGFloat = 5.0
    
    enum ArrowDirection {
        case up, down, left, right
    }
    
    enum ArrowLocation {
        case toRight, toLeft
    }
    
    var isPressed = false {
        willSet {
            print("isPressed : \(newValue)")
        }
        didSet {
            setNeedsDisplay()
        }
    }
    var activeArrow = ArrowDirection.up
    var deActiveArrow:ArrowDirection = .down
    var arrowLocation:ArrowLocation = .toRight
        
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if isPressed {
            drawArrow(activeArrow)
        } else {
            drawArrow(deActiveArrow)
        }
        
    }
    
    init(frame: CGRect, _ activeArrowDirection:ArrowDirection, _ deActiveArrowDirection:ArrowDirection, _ arrowLocation:ArrowLocation) {
        super.init(frame: frame)
        activeArrow = activeArrowDirection
        deActiveArrow = deActiveArrowDirection
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawArrow(_ arrowDirection:ArrowDirection) {
        
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setLineWidth(1.0)
        
        let origin = getOriginForArrowLocation(arrowLocation)
        
        switch arrowDirection {
        case .up:
            context?.move(to: CGPoint(x:origin.x, y:frame.height - ArrowButtons.padding))
            context?.addLine(to: CGPoint(x:origin.x + (frame.height - 2 * ArrowButtons.padding).divided(by: 2.0), y:2 * ArrowButtons.padding))
            context?.addLine(to: CGPoint(x:origin.x + (frame.height - 2 * ArrowButtons.padding), y:frame.height - ArrowButtons.padding))
        case .down:
            context?.move(to: CGPoint(x:origin.x, y:origin.y))
            context?.addLine(to: CGPoint(x:origin.x + (frame.height - 2 * ArrowButtons.padding).divided(by: 2.0), y:frame.height - 2 * ArrowButtons.padding))
            context?.addLine(to: CGPoint(x:origin.x + (frame.height - 2 * ArrowButtons.padding), y: ArrowButtons.padding))
        case .left:
            context?.move(to: CGPoint(x:origin.x + (frame.height - 2 * ArrowButtons.padding), y:origin.y))
            context?.addLine(to: CGPoint(x:origin.x, y:(frame.height - 2 * ArrowButtons.padding).divided(by: 2.0)))
            context?.addLine(to: CGPoint(x:origin.x + (frame.height - 2 * ArrowButtons.padding), y:frame.height - 2 * ArrowButtons.padding))
        case .right:
            context?.move(to: CGPoint(x:origin.x, y:origin.y))
            context?.addLine(to: CGPoint(x:origin.x + (frame.height - 2 * ArrowButtons.padding), y:(frame.height - 2 * ArrowButtons.padding).divided(by: 2.0)))
            context?.addLine(to: CGPoint(x:origin.x, y:frame.height - 2 * ArrowButtons.padding))
        }
        
        context?.drawPath(using: .stroke)
    }
    
    func getOriginForArrowLocation(_ arrowLocation:ArrowLocation) -> CGPoint {
        
        var x:CGFloat = 0.0, y:CGFloat = 0.0
        
        switch arrowLocation {
        case .toRight:
            x = frame.size.width - ArrowButtons.padding - frame.height
            y = 5
        case .toLeft:
            x = 5
            y = 5
        }
        return CGPoint(x: x, y: y)
    }
    
}

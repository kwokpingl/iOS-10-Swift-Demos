//
//  InfiniteScorllV.swift
//  All My Demos
//
//  Created by Jimmy on 2017/12/9.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

import Foundation
import UIKit

class InfiniteScrollV: UIScrollView, UIScrollViewDelegate {
    
    var visibleBuildings = [InfiniteScrollSubView]()
    var containerView   = UIView()
    
    // MARK: - LIFE CYCLE
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupContents()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        recenteredIfNeeded()
        
        // tile content in visible bounds
        let visibleBounds = bounds
        let minVisibleX = visibleBounds.minX
        let maxVisibleX = visibleBounds.maxX
        // tile the visible view
        tileBuildings(from: minVisibleX, to: maxVisibleX)
    }
    
    // MARK: LIFE CYCLE FUNCTIONs
    
    func recenteredIfNeeded() {
        // get CenterOffSetX
        let currentOffsetX = contentOffset.x
        
        let centerOffsetX = (contentSize.width - bounds.width).divided(by: 2.0)
        
        let distanceFromCenter = fabs(centerOffsetX - currentOffsetX)
        
        let deltaDistance = contentSize.width * 0.25
        
        if  distanceFromCenter > deltaDistance {
            
            contentOffset = CGPoint(x:centerOffsetX ,y: contentOffset.y)
            
            // Move content when neccessary
            for building in visibleBuildings {
                var center = building.center
                print("OLD CENTER: \(center)")
                center.x += (centerOffsetX - currentOffsetX)
                building.center = center
            }
        }
    }
    
    func setupContents() {
        contentSize = CGSize(width: 5000, height: InfiniteScrollSubView.heightOfTallestBuilding())
        
        containerView.frame = CGRect(x: 0, y: 0, width: contentSize.width, height: contentSize.height)
        
        addSubview(containerView)
        
        indicatorStyle = .white
        showsHorizontalScrollIndicator = true
        showsVerticalScrollIndicator = true
    }
    
    func tileBuildings(from minX:CGFloat, to maxX:CGFloat) {
        if visibleBuildings.count == 0 {
            _ = addNewBuildingOnTheRight(minX)
        }
        
        // if there is already building presented
        var rightEdge = visibleBuildings.last?.frame.maxX ?? minX
        
        // if the rightEdge is greater than maxX, there might be missing buildings on the left
        while rightEdge < maxX {
            rightEdge = addNewBuildingOnTheRight(rightEdge)
        }
        
        var leftEdge = visibleBuildings.first?.frame.minX ?? maxX
        
        while leftEdge > minX {
            leftEdge = addNewBuildingOnTheLeft(leftEdge)
        }
        
        // REMOVE building that is off the right edge
        var lastBuildingFrameX = visibleBuildings.last?.frame.origin.x ?? (maxX + 1)
        
        while lastBuildingFrameX > maxX {
            visibleBuildings.last?.removeFromSuperview()
            _ = visibleBuildings.removeLast()
            lastBuildingFrameX = visibleBuildings.last?.frame.origin.x ?? (maxX + 1)
        }
        
        // REMOVE building that is off the left edge
        
        var firstBuildingFrameX = visibleBuildings.first?.frame.origin.x ?? (minX - 1)
        
        while firstBuildingFrameX < minX {
            visibleBuildings.first?.removeFromSuperview()
            _ = visibleBuildings.removeFirst()
            firstBuildingFrameX = visibleBuildings.first?.frame.origin.x ?? (minX - 1)
        }
    }
    
    func addNewBuildingOnTheRight(_ originX:CGFloat) -> CGFloat {
        let newBuilding = InfiniteScrollSubView.randomBuildingView()
        let newOriginY = containerView.frame.height - newBuilding.frame.height
        let newOrigin = CGPoint(x: originX, y: newOriginY)
        let newFrame = CGRect(origin: newOrigin, size: newBuilding.frame.size)
        
        newBuilding.frame = newFrame
        visibleBuildings.append(newBuilding)
        
        containerView.addSubview(newBuilding)
        
        return newFrame.maxX
    }
    
    func addNewBuildingOnTheLeft(_ originX:CGFloat) -> CGFloat {
        let newBuilding = InfiniteScrollSubView.randomBuildingView()
        let newOriginY = containerView.frame.height - newBuilding.frame.height
        let newOriginX = originX - newBuilding.frame.width
        let newOrigin = CGPoint(x: newOriginX, y: newOriginY)
        let newFrame = CGRect(origin: newOrigin, size: newBuilding.frame.size)
        
        newBuilding.frame = newFrame
        visibleBuildings.insert(newBuilding, at: 0)
        
        containerView.addSubview(newBuilding)
        
        return newFrame.minX
    }
    
    
}

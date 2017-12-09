//
//  StoryboardInfos.swift
//  All My Demos
//
//  Created by Jimmy on 2017/12/5.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

import Foundation
import UIKit

struct StoryboardInfos {
    
    enum Topics: String {
        case String = "String"
        case Animation = "Animation"
        case Others = "Others"
        case WWDC = "WWDC"
    }
    
    static let topics = ["String", "Animation", "Others", "WWDC"]
    
    // STRING STORYBOARD
    struct StringStoryboard {
        
        enum Scenes: String {
            case AttributedString = "Attributed String"
        }
        
        static let id = "String"
        static let sceneIDs = ["Attributed String"]
    }
    
    // ANIMATION STORYBOARD
    struct AnimationStoryboard {
        static let id = "Animation"
        static let sceneIDs = [""]
    }
    
    // OTHERs STORYBOARD
    struct OthersStoryboard {
        
        enum Scenes: String {
            case NumericalLimits = "Numerical Limits"
        }
        
        static let id = "Others"
        static let sceneIDs = ["Numerical Limits"]
    }
    
    struct WWDCStoryboard {
        enum Scenes: String {
            case WWDC_2011_InfiniteScrollView = "WWDC_2011 InfiniteScrollView"
        }
        
        static let id = "WWDC"
        static let sceneIDs = ["WWDC_2011 InfiniteScrollView"]
    }
    
    ///////////////////////////////
    //      FUNCTIONs
    ///////////////////////////////
    // MARK: - FUNCTIONS
    func getDemosForStoryboards(_ storyboards:[Topics]) -> [String:Array<String>] {
        
        var finalList = [String:Array<String>]()
        
        for storyboard in storyboards {
            switch storyboard {
            case .Animation:
                finalList[AnimationStoryboard.id] = AnimationStoryboard.sceneIDs
            case .Others:
                finalList[OthersStoryboard.id] = OthersStoryboard.sceneIDs
            case .String:
                finalList[StringStoryboard.id] = StringStoryboard.sceneIDs
            case .WWDC:
                finalList[WWDCStoryboard.id] = WWDCStoryboard.sceneIDs
            }
        }
        return finalList
    }
    
    func getStoryboardForTopic(_ topic:String) -> UIStoryboard? {
        return UIStoryboard.getStoryboardWithName(topic)
    }
    
}

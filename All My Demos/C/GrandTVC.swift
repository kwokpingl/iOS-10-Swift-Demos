//
//  GrandTVC.swift
//  All My Demos
//
//  Created by Jimmy on 2017/12/1.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

import Foundation
import UIKit

class GrandTVC : UITableViewController {
    
    var listOfTopics    = StoryboardInfos.topics {
        didSet {
            // MARK: MISTAKE listOfBooleans
            // if I placed in ViewDidLoad, the listOfBooleans will still be [true] when read by the TABLE
            listOfBooleans = [Bool](repeating: false, count: listOfTopics.count)
        }
    }
    var listOfDemos     = StoryboardInfos().getDemosForStoryboards(
        [StoryboardInfos.Topics.Animation,
         StoryboardInfos.Topics.Others,
         StoryboardInfos.Topics.String])
    
    lazy var listOfBooleans  = [true]
    var headerHeights   = [CGFloat]()
    
    // MARK: - LIFE CYCLE
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        headerHeights = [CGFloat](repeating: 0.0, count:listOfTopics.count)
        listOfTopics.sort(by: {$0 < $1})
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellIDs.tableViewBasicCellID)
        tableView.register(GrandTVHeader.self, forHeaderFooterViewReuseIdentifier: CellIDs.tableViewBasicCellHeaderID)
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // MARK: - TABLE VIEW DATA SOURCE
    override func numberOfSections(in tableView: UITableView) -> Int {
        return listOfTopics.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = listOfTopics[section]
        if let array = listOfDemos[key] {
            if listOfBooleans[section] {
                return array.count
            }
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CellIDs.tableViewBasicCellHeaderID) as? GrandTVHeader
        
        if header == nil {
            header = GrandTVHeader.init(reuseIdentifier: CellIDs.tableViewBasicCellHeaderID)
        }
        
        header?.buttonTitle(listOfTopics[section])
        
        print("\(listOfTopics[section])")
        
        header?.isOpen = listOfBooleans[section]
        
        header?.buttonIsPressed = {[weak self] (isPressed:Bool) in
            
            self?.listOfBooleans[section] = isPressed
            self?.tableView.reloadSections(IndexSet(integer: section), with: .fade)
        }
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIDs.tableViewBasicCellID, for: indexPath) as UITableViewCell
        
        if let array = listOfDemos[listOfTopics[indexPath.section]],
            let str = array.getObjectAtIndex(indexPath.row) {
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = str
        }
        
        return cell
    }
    
    // MARK: - TABLE VIEW DELEGATE
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let chosenTopic = listOfTopics[indexPath.section]
        
        guard let selectedStoryboard = StoryboardInfos().getStoryboardForTopic(chosenTopic),
            let identifiers = listOfDemos[chosenTopic],
            let identifier = identifiers.getObjectAtIndex(indexPath.row) ,
            let topicEnum = StoryboardInfos.Topics(rawValue: chosenTopic)
            else {
            return
        }
        
        let viewController = selectedStoryboard.instantiateViewController(withIdentifier: identifier)
        
        switch topicEnum {
        case .String:
        
            guard let stringDemoEnum = StoryboardInfos.StringStoryboard.Scenes(rawValue: identifier) else {
                return
            }
            
            switch stringDemoEnum {
            case .AttributedString:
                if let vc = viewController as? AttributedStringTVC {
                    navigationController?.pushViewController(vc, animated: true)
                }
            default:
                return
            }
            
        default:
            return
        }
        
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if listOfBooleans[indexPath.section] {
            return 10
        }
        return 0
    }
    
    
    // MARK: - MISTAKEs
    // MARK: JUMPy HEADER when RELOADED
    /*
     FIXED:
     By giving an estimatedHeightForHeader, and save the ACTUAL height at willDisplayHeaderView, and return the ACTUAL height when asked for the estimatedHeightForHeader will do the trick
     */
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        if view.frame.height > 0 {
            headerHeights[section] = view.frame.height
        }
    }
    
     override func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        if let height = headerHeights.getObjectAtIndex(section), height > 0 {
            return height
        }
        
        return 20
    }
 
    
    
}

//
//  AttributedStringTVC.swift
//  All My Demos
//
//  Created by Jimmy on 2017/12/5.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

import Foundation
import UIKit


protocol test {
    var label:UILabel {get set}
}

class AttributedStringTVC: UITableViewController, test {
    
    @IBOutlet weak var mylabel : UILabel!
    
    var label: UILabel {
        get {
            return mylabel
        }
        set {
            
        }
    }
    
    var attributedStrings = [NSAttributedString]()
    var normalStrings = [String]()
    
    static let fontSize:CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Example 1
        attributedStrings.append(example1("This should give an instance adjusted Size"))
        // Example 2
        attributedStrings.append(example2("This should have FIXED Size no matter what"))
        // Example 3
        attributedStrings.append(example3("This is string with PREFERREDFONT of .Body"))
        
        // Strings
        normalStrings = [".Headline", ".SubHeadline", ".Body", ".Caption1", ".Caption2", ".Footnote", ".Callout", "System Font Size of 20", "adjustsFontSizeToFitWidth, adjustsFontSizeToFitWidth", "Testing"]
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellIDs.tableViewBasicCellID)
        tableView.estimatedRowHeight = 10
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // MARK: - TABLE VIEW DATASOURCE
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return normalStrings.count
        case 1:
            return attributedStrings.count
        default:
            return 0
        }
    }
    
    // MARK: - TABLE VIEW DELEGATE
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIDs.tableViewBasicCellID, for: indexPath)
        
        let section = indexPath.section
        let row = indexPath.row
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        switch section {
        case 0:
            switch row {
            case 0:
                // .Body
                cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
            case 1:
                cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .subheadline)
            case 2:
                cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .body)
            case 3:
                cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .caption1)
            case 4:
                cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .caption2)
            case 5:
                cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .footnote)
            case 6:
                cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .callout)
            case 7:
                cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
            case 8:
                cell.textLabel?.baselineAdjustment = .alignCenters
                
                guard let width = cell.textLabel?.frame.width else {
                    return cell
                }
                
                let size = UIFont.preferredFont(forTextStyle: .body).sizeOfString(normalStrings[row], constrainedToWidth: width)
                cell.frame.size = size
                
            case 9:
                cell.textLabel?.font = UIFont(name: "Miraculous&Christmas", size: 40)
            default:
                
                break
            }
            cell.textLabel?.text = normalStrings[row]
        case 1:
            switch row {
            case 0:
                cell.textLabel?.font = UIFont(descriptor: UIFontDescriptor.christmasPreferredFontDescriptor(textStyle: .body), size: UIFontDescriptor.currentPreferredSize())
                break
            case 1:
                cell.textLabel?.font = UIFont(name: "Old London", size: 10)
            default:
                break
            }
            cell.textLabel?.attributedText = attributedStrings[row]
        default:
            break
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "NORMAL STRINGs"
        case 1:
            return "ATTRIBUTED STRINGs"
        default:
            return nil
        }
    }
    
    // MARK: - METHODs
    // MARK: ATTRIBUTED STRINGs
    //////////////////
    // Example 1 : 
    // This should return an instance font size of the string
    //////////////////
    func example1(_ str:String) -> NSAttributedString {
        let font = UIFont(descriptor: UIFontDescriptor.christmasPreferredFontDescriptor(textStyle: .body), size: UIFontDescriptor.currentPreferredSize(textStyle: .body))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        return NSAttributedString(string: str, attributes: ["NSParagraphStyleAttributeName":paragraphStyle, "NSFontAttributeName": font])
    }
    
    ////////////////
    // Example 2:
    ////////////////
    func example2(_ str:String) -> NSAttributedString {
        let font = UIFont(name: "Old London", size: 10)
        
        guard let _font = font else {
            return NSAttributedString(string: "Not Working")
        }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        return NSAttributedString(string: str, attributes: [ "NSParagraphStyleAttributeName" : paragraphStyle, "NSFontAttributeName" : _font,])
    }
    
    func example3(_ str:String) -> NSAttributedString {
        let font = UIFont(descriptor: UIFontDescriptor.christmasPreferredFontDescriptor(textStyle: .body), size: UIFontDescriptor.currentPreferredSize())
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        return NSAttributedString(string: str, attributes: ["NSFontAttributeName" : font, "NSParagraphStyleAttributeName" : paragraphStyle])
    }
    
    ////////////////
    // Example 4:
    ////////////////
//    func example4(_ str:String) -> String {
//        let font = UIFont(name: "Helvetica", size: 15)
//        str
//    }
    
    ////////////
    // SET BACK BUTTON
    ////////////
    func setupNavigationLeftBtn() {
        let backimg = UIImage(named: "BackArrow")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: backimg, style: .plain, target: nil, action: nil)
        
    }
}

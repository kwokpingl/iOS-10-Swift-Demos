//
//  GrandTVHeader.swift
//  All My Demos
//
//  Created by Jimmy on 2017/12/3.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
open class GrandTVHeader: UITableViewHeaderFooterView {
    
    var buttonIsPressed:((Bool)->())?
    
    var button:ArrowButtons = ArrowButtons(frame: .zero, ArrowButtons.ArrowDirection.up, ArrowButtons.ArrowDirection.down, ArrowButtons.ArrowLocation.toRight)
    var isOpen = false {
        didSet {
            button.isPressed = isOpen
        }
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
//        if button.frame != bounds {
            button.frame = bounds
//        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        print(#function)
        contentView.backgroundColor = .clear
        button.tag = 0
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        addSubview(button)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - BUTTON SETUP
    func buttonTitle(_ title:String) {
        button.setTitle(title, for: .normal)
    }
    
    func buttonPressed(_ sender:UIButton) {
        isOpen = !isOpen
        buttonIsPressed?(isOpen)
    }
    
}

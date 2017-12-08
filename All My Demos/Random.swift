//
//  Random.swift
//  All My Demos
//
//  Created by Jimmy on 2017/12/4.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

//import Foundation
import UIKit

@IBDesignable
class Random: UIView {
    
    var buttonImage = UIImage(named: "target")
    @IBInspectable var labelText   = "Label"
    
    var imageView:UIImageView? //UIImageView(image: UIImage(named: "target"))
    var label:UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 你要做的事情
        // 你可以直接給 frame
//        imageView = UIImageView(frame: <#T##CGRect#>)
        
        // or 用 constraint
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func setupUI() {
        imageView = {
            let imgV = UIImageView()
            imgV.sizeToFit()
            imgV.translatesAutoresizingMaskIntoConstraints = false
            return imgV
        }()
        
        label = {
            let lb = UILabel()
            lb.textColor = .black
            lb.sizeToFit()
            lb.translatesAutoresizingMaskIntoConstraints = false
            return lb
        }()
        
        guard let imageView = imageView, let label = label else {
            return
        }
        
        addSubview(imageView)
        addSubview(label)
        
        imageView.image = buttonImage
        label.text = "Label"
        // 將 label 放在中心
        let labelY = NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0)
        let labelX = NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0)
        // 設 label 高度 = self.height * 0.9
        let labelHeight = NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0.9, constant: 0)
        // 對齊 imageView Y
        let imageViewY = NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0)
        // 對齊 imageView-(5)-label 並中間有 5 points 間隔
        let imageViewTrailing = NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: label, attribute: .leading, multiplier: 1.0, constant: -5)
        // 將 imageView 高度 = self.height*0.6
        let imageViewHeight = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0.6, constant: 0)
        // 將 imageView 等寬高
        let imageViewWidth = NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: imageView, attribute: .height, multiplier: 1.0, constant: 0)
        
        addConstraints([labelY, labelX, labelHeight, imageViewY, imageViewTrailing, imageViewHeight, imageViewWidth])
    }
}

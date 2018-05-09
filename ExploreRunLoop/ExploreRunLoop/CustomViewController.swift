//
//  CustomViewController.swift
//  ExploreRunLoop
//
//  Created by Andrew on 2018/5/8.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit
import Foundation
import CoreGraphics

class CustomeView: UIView{
    override func draw(_ rect: CGRect) {
        if let context = UIGraphicsGetCurrentContext(){
            UIColor.blue.setFill()
            context.fill(rect)
        }
    }
}

class CustomViewController: UIViewController{
    @IBOutlet weak var view1: CustomeView!
    
    @IBAction func buttonTapped(_ sender: Any) {
        view1.setNeedsDisplay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

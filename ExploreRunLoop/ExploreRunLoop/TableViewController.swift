//
//  TableViewController.swift
//  ExploreRunLoop
//
//  Created by Andrew on 2018/4/24.
//  Copyright © 2018 Andrew. All rights reserved.
//

import Foundation
import UIKit

class TableViewController : UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print(RunLoop.current.currentMode!)
    }
    
    override func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        print(RunLoop.current.currentMode!)
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print(RunLoop.current.currentMode!)
    }
}

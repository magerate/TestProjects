//
//  BatchChangeViewController.swift
//  Views_with_Intrinsic_Content_Size
//
//  Created by Andrew on 2018/4/19.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit

class DummyView: UIView {
    
    override func updateConstraints() {
        super.updateConstraints()
        
        guard let constraint = constraints.first else {return}
        
        if constraint.constant <= 150 {
            constraint.constant *= 2
        } else {
            constraint.constant = 100
        }
    }
}

class BatchChange1ViewController: UIViewController {
    
    @IBOutlet weak var dummyView: DummyView!
    
    @IBAction func buttonTaped(_ sender: Any) {
        dummyView.setNeedsUpdateConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        
    }

}

//
//  ChangeConstraintViewController.swift
//  Views_with_Intrinsic_Content_Size
//
//  Created by Andrew Chai on 4/18/18.
//  Copyright © 2018 Andrew. All rights reserved.
//

import Foundation
import UIKit

class ChangeConstraintViewController: UIViewController {
    
    @IBOutlet weak var bottomButton: UIButton!
    
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        
        leadingConstraint = bottomButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor)
        trailingConstraint = safeArea.trailingAnchor.constraint(equalTo: bottomButton.trailingAnchor)
        let bottomConstraint = safeArea.bottomAnchor.constraintEqualToSystemSpacingBelow(bottomButton.bottomAnchor, multiplier: 1)
        
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint,bottomConstraint])
    }
    
    override func viewWillLayoutSubviews() {
        
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func buttonTaped(_ sender: Any) {
        if leadingConstraint.constant == 0 {
            leadingConstraint.constant = 20
        } else {
            leadingConstraint.constant = 0
        }
        
        if trailingConstraint.constant == 0 {
            trailingConstraint.constant = 20
        } else {
            trailingConstraint.constant = 0
        }
        
    }
}

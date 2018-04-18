//
//  BatchChangeViewController.swift
//  Views_with_Intrinsic_Content_Size
//
//  Created by Andrew Chai on 4/18/18.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit
import Foundation

class BatchChangeViewController: UIViewController {
    
    @IBOutlet weak var shortButton: UIButton!
    @IBOutlet weak var longButton: UIButton!
    
    var shortTrailingCompact: NSLayoutConstraint!
    var shortBottomCompact: NSLayoutConstraint!
    
    
    var longLeadingCompact: NSLayoutConstraint!
    var longTopCompact: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        shortButton.translatesAutoresizingMaskIntoConstraints = false
        longButton.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        
        let shortLeading = shortButton.leadingAnchor.constraintEqualToSystemSpacingAfter(safeArea.leadingAnchor, multiplier: 1)
        shortTrailingCompact = safeArea.trailingAnchor.constraintEqualToSystemSpacingAfter(shortButton.trailingAnchor, multiplier: 1)
        
        longLeadingCompact = longButton.leadingAnchor.constraintEqualToSystemSpacingAfter(safeArea.leadingAnchor, multiplier: 1)
        let longTrailing = safeArea.trailingAnchor.constraintEqualToSystemSpacingAfter(longButton.trailingAnchor, multiplier: 1)
        
        longTopCompact = longButton.topAnchor.constraintEqualToSystemSpacingBelow(shortButton.bottomAnchor, multiplier: 1)
//        longTopCompact.priority = .defaultLow
        let longBottom = safeArea.bottomAnchor.constraintEqualToSystemSpacingBelow(longButton.bottomAnchor, multiplier: 1)
        
        let width = shortButton.widthAnchor.constraint(equalTo: longButton.widthAnchor)
        
        NSLayoutConstraint.activate([
            shortLeading,
            shortTrailingCompact,
            longLeadingCompact,
            longTrailing,
            longTopCompact,
            longBottom,
            width
            ])
//        if traitCollection.containsTraits(in: UITraitCollection.)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

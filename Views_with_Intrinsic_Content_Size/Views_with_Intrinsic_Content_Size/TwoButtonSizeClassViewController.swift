//
//  BatchChangeViewController.swift
//  Views_with_Intrinsic_Content_Size
//
//  Created by Andrew Chai on 4/18/18.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit
import Foundation

class TwoButtonSizeClassViewController: UIViewController {
    
    
    @IBOutlet weak var shortButton: UIButton!
    @IBOutlet weak var longButton: UIButton!
    
    
    var compactConstraints = [NSLayoutConstraint]()
    var regularConstraints = [NSLayoutConstraint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        shortButton.translatesAutoresizingMaskIntoConstraints = false
        longButton.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        
        let shortLeading = shortButton.leadingAnchor.constraintEqualToSystemSpacingAfter(safeArea.leadingAnchor, multiplier: 1)
        let shortTrailingCompact = safeArea.trailingAnchor.constraintEqualToSystemSpacingAfter(shortButton.trailingAnchor, multiplier: 1)
        
        let shortBottomCompact = longButton.topAnchor.constraintEqualToSystemSpacingBelow(shortButton.bottomAnchor, multiplier: 1)
        
        
        let longLeadingCompact = longButton.leadingAnchor.constraintEqualToSystemSpacingAfter(safeArea.leadingAnchor, multiplier: 1)
        let longTrailing = safeArea.trailingAnchor.constraintEqualToSystemSpacingAfter(longButton.trailingAnchor, multiplier: 1)
        
        let longBottom = safeArea.bottomAnchor.constraintEqualToSystemSpacingBelow(longButton.bottomAnchor, multiplier: 1)
        
        
        let shortTrailing = longButton.leadingAnchor.constraintEqualToSystemSpacingAfter(shortButton.trailingAnchor, multiplier: 1)
        let shortBottom = safeArea.bottomAnchor.constraintEqualToSystemSpacingBelow(shortButton.bottomAnchor, multiplier: 1)
        let width = shortButton.widthAnchor.constraint(equalTo: longButton.widthAnchor)
        
        
        NSLayoutConstraint.activate([
            shortLeading,
            longTrailing,
            longBottom,
            ])
        
        compactConstraints = [shortTrailingCompact, shortBottomCompact, longLeadingCompact ]
        regularConstraints = [shortTrailing, shortBottom, width]
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if traitCollection.horizontalSizeClass == .compact {
            NSLayoutConstraint.deactivate(regularConstraints)
            NSLayoutConstraint.activate(compactConstraints)
        } else {
            NSLayoutConstraint.deactivate(compactConstraints)
            NSLayoutConstraint.activate(regularConstraints)
        }
    }
    
    
   
}

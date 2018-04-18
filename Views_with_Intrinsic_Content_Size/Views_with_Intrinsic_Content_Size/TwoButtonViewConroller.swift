//
//  TwoButtonEqualSpaceLayoutGuideViewConroller.swift
//  Views_with_Intrinsic_Content_Size
//
//  Created by Andrew on 2018/4/17.
//  Copyright © 2018 Andrew. All rights reserved.
//

import Foundation
import UIKit

class TwoButtonViewConroller: UIViewController {
    
    @IBOutlet weak var shortButton: UIButton!
    @IBOutlet weak var longButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        shortButton.translatesAutoresizingMaskIntoConstraints = false
        longButton.translatesAutoresizingMaskIntoConstraints = false
        
        let leftSpace = UILayoutGuide()
        let middleSpace = UILayoutGuide()
        let rightSpace = UILayoutGuide()
        view.addLayoutGuide(leftSpace)
        view.addLayoutGuide(middleSpace)
        view.addLayoutGuide(rightSpace)
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            leftSpace.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            leftSpace.trailingAnchor.constraint(equalTo: shortButton.leadingAnchor),
            shortButton.trailingAnchor.constraint(equalTo: middleSpace.leadingAnchor),
            middleSpace.trailingAnchor.constraint(equalTo: longButton.leadingAnchor),
            longButton.trailingAnchor.constraint(equalTo: rightSpace.leadingAnchor),
            rightSpace.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            shortButton.widthAnchor.constraint(equalTo: longButton.widthAnchor),
            leftSpace.widthAnchor.constraint(equalTo: middleSpace.widthAnchor),
            leftSpace.widthAnchor.constraint(equalTo: rightSpace.widthAnchor),
            
            shortButton.leadingAnchor.constraintGreaterThanOrEqualToSystemSpacingAfter(safeArea.leadingAnchor, multiplier: 1),
            longButton.leadingAnchor.constraintGreaterThanOrEqualToSystemSpacingAfter(shortButton.trailingAnchor, multiplier: 1),
            
            safeArea.bottomAnchor.constraintEqualToSystemSpacingBelow(shortButton.bottomAnchor, multiplier: 1),
            safeArea.bottomAnchor.constraintEqualToSystemSpacingBelow(longButton.bottomAnchor, multiplier: 1)
            ])
    }
    
    override func viewWillLayoutSubviews() {

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

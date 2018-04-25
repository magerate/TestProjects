//
//  ViewController.swift
//  ExploreRunLoop
//
//  Created by Andrew on 2018/4/24.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit

extension CFRunLoopActivity  : CustomDebugStringConvertible {
    
    public var debugDescription: String {
        var activityValue = ""
        if self == CFRunLoopActivity.entry {
            activityValue = "entry"
        } else if self == CFRunLoopActivity.beforeTimers {
            activityValue = "beforeTimers"
        } else if self == CFRunLoopActivity.beforeSources {
            activityValue = "beforeSources"
        } else if self == CFRunLoopActivity.beforeWaiting {
            activityValue = "beforeWaiting"
        } else if self == CFRunLoopActivity.afterWaiting {
            activityValue = "afterWaiting"
        } else if self == CFRunLoopActivity.exit {
            activityValue = "exit"
        }
        
        return "\(activityValue) rawValue = \(self.rawValue) mode = \(RunLoop.current.currentMode!)"
    }
    
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupRunLoopObserver() {
        let myRunLoop = RunLoop.current
        
        let observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault,
                                                          CFRunLoopActivity.allActivities.rawValue ,
                                                          true, 0,
                                                          runLoopHandler)
        
        CFRunLoopAddObserver(myRunLoop.getCFRunLoop(), observer, CFRunLoopMode.commonModes)
        
    }
    
    func runLoopHandler(observer: CFRunLoopObserver?, activity: CFRunLoopActivity) {
        print(activity)
    }


}


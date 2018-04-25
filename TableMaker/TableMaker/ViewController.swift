//
//  ViewController.swift
//  TableMaker
//
//  Created by Andrew Chai on 4/25/18.
//  Copyright © 2018 Andrew Chai. All rights reserved.
//

import UIKit

class IntFloatConverter: Converter<Int,Float>{
    public override func convert(_ value: Int) -> Float {
        return Float(value)
    }
}


class ViewController: UIViewController {

    @IBAction func buttonTapped(_ sender: Any) {
        let people = People()
        people.name = "Allen"
        
        let item1 = LabelItem1(people)
        item1.title = "Name"
        item1.getter = {$0.name}

        
        let item2 = LabelItem2<People, Int>(people)
        item2.title = "Age"
        item2.getter = {$0.age}
        
        let section = DetailSection()
        section.items = [item1,item2]
        
        let sections = [section]
        
        let viewController = DetailViewController()
        viewController.sections = sections
        
        present(viewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


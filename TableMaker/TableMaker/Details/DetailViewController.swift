//
//  DetailViewController.swift
//  TableMaker
//
//  Created by Andrew Chai on 4/25/18.
//  Copyright © 2018 Andrew Chai. All rights reserved.
//

import Foundation
import UIKit


public class DetailViewController: UITableViewController {
    var sections = [DetailSection]()
   
    public init(){
        super.init(style: .grouped)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let ds = sections[section]
        return ds.items.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ds = sections[indexPath.section]
        let item = ds.items[indexPath.row]
        
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: item.identifier){
            item.setup(tableView, cell: cell, at: indexPath)
            return cell
        } else {
            let cell = item.createCell()
            item.setup(tableView, cell: cell, at: indexPath)
            return cell
        }
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ds = sections[indexPath.section]
        let item = ds.items[indexPath.row]
        item.select(tableView, at: indexPath)
    }
}

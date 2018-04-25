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
   
    override public func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let ds = sections[section]
        return ds.items.count
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ds = sections[indexPath.section]
        let item = ds.items[indexPath.row]
        
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: item.cellId){
            item.setup(tableView, cell: cell, at: indexPath)
            return cell
        } else {
            let cell = item.createCell()
            item.setup(tableView, cell: cell, at: indexPath)
            return cell
        }
    }
}

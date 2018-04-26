//
//  LabelItem.swift
//  TableMaker
//
//  Created by Andrew Chai on 4/25/18.
//  Copyright © 2018 Andrew Chai. All rights reserved.
//

import UIKit
import Foundation


public class LabelItem<T, U, V>: DataTableItem<T,U,V>{
    public override var identifier: String {
        return "labelCellReuseId"
    }
    
    public override func createCell() -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: identifier)
        cell.selectionStyle = .none
        return cell
    }
    
    public override func setup(_ tableView: UITableView, cell: UITableViewCell, at indexPath: IndexPath) {
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = getDescription()
    }
}

public class LabelItem2<T,U>: LabelItem<T,U,U>{
}

public class LabelItem1<T>: LabelItem<T, String?, String?>{
    public override init(_ data: T) {
        super.init(data)
        formatter = stringFormatter
    }
}

//
//  LabelItem.swift
//  TableMaker
//
//  Created by Andrew Chai on 4/25/18.
//  Copyright © 2018 Andrew Chai. All rights reserved.
//

import UIKit
import Foundation


public class LabelItem<T, U, K>: DetailItem<T,U,K>{

    public override var cellId: String {
        return "labelCellReuseId"
    }
    
    public override func createCell() -> UITableViewCell {
        return UITableViewCell(style: .value1, reuseIdentifier: cellId)
    }
    
    public override func setup(_ tableView: UITableView, cell: UITableViewCell, at indexPath: IndexPath) {
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = getDescription()
    }
}

public class LabelItem2<T,U>: LabelItem<T,U,U>{
}

public class LabelItem1<T>: LabelItem<T, String?, String?>{
    public override init(_ data: T, fetcher: ValueFetcher<T,String?>) {
        super.init(data, fetcher: fetcher)
        formatter = defaultFormatter
    }
}

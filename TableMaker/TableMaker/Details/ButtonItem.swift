//
//  ButtonItem.swift
//  TableMaker
//
//  Created by Andrew on 2018/4/25.
//  Copyright © 2018 Andrew Chai. All rights reserved.
//

import UIKit
import Foundation

public class ButtonCell: UITableViewCell {
    let button: UIButton!
    
    public init(reuseIdentifier: String?) {
        button = UIButton(type: .custom)
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(button)
    }
    
    public override func layoutSubviews() {
        button.frame = contentView.bounds
    }
    
    public override func prepareForReuse() {
        button.removeTarget(nil, action: nil, for: .allEvents)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("not implemented")
    }
}

public class ButtonItem: TableItem {
    public var title: String?
    public var titleColor = UIColor.darkText
    
    public var action: (() -> Void)?
    
    public var identifier: String {
        return "buttonCellReuseId"
    }
    
    public func createCell() -> UITableViewCell {
        let cell = ButtonCell(reuseIdentifier: identifier)
        cell.selectionStyle = .none
        return cell
    }
    
    public func setup(_ tableView: UITableView, cell: UITableViewCell, at indexPath: IndexPath) {
        let cell = cell as! ButtonCell
        cell.button.setTitle(title, for: .normal)
        cell.button.setTitleColor(titleColor, for: .normal)
        cell.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    public func select(_ tableView: UITableView, at indexPath: IndexPath) {
    }
    
    @objc func buttonTapped() {
        if let action = action {
            action()
        }
    }
}

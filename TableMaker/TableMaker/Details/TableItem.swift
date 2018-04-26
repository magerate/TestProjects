//
//  TableItem.swift
//  TableMaker
//
//  Created by Andrew Chai on 4/25/18.
//  Copyright © 2018 Andrew Chai. All rights reserved.
//

import Foundation
import UIKit

public let stringFormatter: (String?) -> String? = {$0}

public class Converter<T, U> {
    public func convert(_ value: T) -> U {
        return value as! U
    }

    public func convertBack(_ value: U) -> T? {
        return nil
    }
}

public protocol ItemHost {
    var viewController: UIViewController {get}
    func valueWillChange(_ tableItem: TableItem)
    func valueDidChange(_ tableItem: TableItem)
}

public protocol TableItem {
    var title: String? {get set}
    var identifier: String {get}
    
    func createCell() -> UITableViewCell
    func setup(_ tableView: UITableView, cell: UITableViewCell, at indexPath: IndexPath)
    func select(_ tableView: UITableView, at indexPath: IndexPath)
}


public class DataTableItem<T, U: Equatable, V>: TableItem{
    public var title: String?
    public var identifier: String {
        fatalError("provide valid id")
    }
    
    public func createCell() -> UITableViewCell {
        fatalError()
    }
    
    public func setup(_ tableView: UITableView, cell: UITableViewCell, at indexPath: IndexPath) {
    }
    
    public func select(_ tableView: UITableView, at indexPath: IndexPath) {
    }
    
    
    public var host: ItemHost?
    
    public var data: T
    public var getter: ((T) -> U)
    public var setter: ((T,U) -> Void)?
    
    public var converter: Converter<U,V>?
    public var formatter: ((V)-> String?)?
    
    init(_ data: T, getter: @escaping (T) -> U) {
        self.data = data
        self.getter = getter
    }
    
    public func getValue() -> U {
        return getter(data)
    }
    
    public func setValue(_ value: V) {
        guard let setter = setter else { return }
        
        if let converter = converter{
            if let cbv = converter.convertBack(value) {
                doSetValue(setter, cbv)
            }
        } else {
            doSetValue(setter, value as! U)
        }
    }
    
    private func doSetValue(_ setter: (T,U) -> Void, _ value: U) {
        if getValue() == value {
            return
        }
        
        host?.valueWillChange(self)
        setter(data, value)
        host?.valueDidChange(self)
    }
    
    public func getConvertedValue() -> V {
        guard let converter = converter else {
            return getValue() as! V
        }
        
        return converter.convert(getValue())
    }
    
    public func getDescription() -> String?{
        guard let formatter = formatter else {
            var s = ""
            print(getConvertedValue(), to: &s)
            return s
        }
        
        return formatter(getConvertedValue())
    }
}



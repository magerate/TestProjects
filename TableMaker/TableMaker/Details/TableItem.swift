//
//  DetailItemBase.swift
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
        fatalError()
    }

    public func convertBack(_ value: U) -> T? {
        fatalError()
    }
}

//public protocol Converter {
//    associatedtype T
//    associatedtype U
//
//    func convert(_ value: T) -> U
//    func convertBack(_ value: U) -> T?
//}

public protocol ItemHost {
    var viewController: UIViewController {get}
}

public protocol TableItem {
    var title: String? {get set}
    var identifier: String {get}
    
    func createCell() -> UITableViewCell
    func setup(_ tableView: UITableView, cell: UITableViewCell, at indexPath: IndexPath)
    func select()
}


public class GenericTableItem<T, U, V>: TableItem{
    public var title: String?
    public var identifier: String {
        fatalError("provide valid id")
    }
    
    public func createCell() -> UITableViewCell {
        fatalError()
    }
    
    public func setup(_ tableView: UITableView, cell: UITableViewCell, at indexPath: IndexPath) {
    }
    
    public func select() {
    }
    
    
    public var host: ItemHost?
    
    public var data: T
    public var getter: ((T) -> U)?
    public var setter: ((T,U) -> Void)?
    
    public var converter: Converter<U,V>?
    public var formatter: ((V)-> String?)?
    
    init(_ data: T) {
        self.data = data
    }
    
    public func getValue() -> U {
        if let getter = getter{
            return getter(data)
        }
        fatalError("Setter of item \(title!) is not set")
    }
    
    public func setValue(_ value: V) {
        var convertedBackValue: U
        if let converter = converter {
            if let cbv = converter.convertBack(value){
                convertedBackValue = cbv
            } else {
                return
            }
        } else {
            convertedBackValue = value as! U
        }
        
        if let setter = setter {
            setter(data, convertedBackValue)
        }
    }
    
    public func getConvertedValue() -> V {
        guard let converter = converter else {
            return getValue() as! V
        }
        
        return converter.convert(getValue())
    }
    
    public func getDescription() -> String?{
        guard let _ = getter else {
            return nil
        }
        
        guard let formatter = formatter else {
            var s = ""
            print(getConvertedValue(), to: &s)
            return s
        }
        
        return formatter(getConvertedValue())
    }
}



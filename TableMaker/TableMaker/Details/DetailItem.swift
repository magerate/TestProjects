//
//  DetailItemBase.swift
//  TableMaker
//
//  Created by Andrew Chai on 4/25/18.
//  Copyright © 2018 Andrew Chai. All rights reserved.
//

import Foundation
import UIKit

public enum ValueFetcher<T, U> {
    case closure ((T) -> U, ((T, U) -> Void)?)
    case mirror(String)
}

public let defaultFormatter = Formatter<String?>({$0})

public struct Formatter<T> {
    public init(_ formatter: @escaping (T) -> String?) {
        self.formatter = formatter
    }
    
    private var formatter: ((T) -> String?)
    
    public func format(_ value: T) -> String? {
        return formatter(value)
    }
}

public class Converter<T, U> {
    public func convert(_ value: T) -> U {
        fatalError()
    }
    
    public func convertBack(_ value: U) -> T? {
        fatalError()
    }
}

public protocol ItemHost {
    var viewController: UIViewController {get}
}

public protocol DetailItemBase {
    var title: String? {get set}
    var cellId: String {get}
    
    func createCell() -> UITableViewCell
    func setup(_ tableView: UITableView, cell: UITableViewCell, at indexPath: IndexPath)
    func select()
}


public class DetailItem<T, U, K>: DetailItemBase{
    public var cellId: String {
        fatalError("provide valid id")
    }
    
    public var title: String?
    
    public var host: ItemHost?
    
    public var data: T
    public var fetcher: ValueFetcher<T,U>
    public var converter: Converter<U,K>?
    public var formatter: Formatter<K>?
    
    init(_ data: T, fetcher: ValueFetcher<T,U>) {
        self.data = data
        self.fetcher = fetcher
    }
    
    public func getValue() -> U {
        switch fetcher {
        case .closure(let getter, _):
            return getter(data)
        default:
            fatalError("mirror getter not support yet")
        }
    }
    
    public func setValue(_ value: K) {
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
        
        switch fetcher {
        case .closure(_, let setter):
            if let setter = setter {
                setter(data, convertedBackValue)
            }
        default:
            fatalError("mirror setter not support yet")
        }
    }
    
    public func getConvertedValue() -> K {
        guard let converter = converter else {
            return getValue() as! K
        }
        
        return converter.convert(getValue())
    }
    
    public func getDescription() -> String?{
        guard let formatter = formatter else {
            var s = ""
            print(getConvertedValue(), to: &s)
            return s
        }
        
        return formatter.format(getConvertedValue())
    }
    
    public func createCell() -> UITableViewCell {
        fatalError()
    }
    
    public func setup(_ tableView: UITableView, cell: UITableViewCell, at indexPath: IndexPath) {
    }
    
    public func select() {
    }
}

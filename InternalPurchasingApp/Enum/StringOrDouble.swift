//
//  StringOrDouble.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/28/24.
//

import Foundation

enum StringOrDouble: Decodable {
    
    case string(String)
    case double(Double)
    
    init(from decoder: Decoder) throws {
        if let double = try? decoder.singleValueContainer().decode(Double.self) {
            self = .double(double)
            return
        };        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(string)
            return
        };        throw Error.couldNotFindStringOrDouble
    };    enum Error: Swift.Error {
        case couldNotFindStringOrDouble
    }
}

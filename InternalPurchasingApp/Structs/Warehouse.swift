//
//  Warehouse.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/25/24.
//

import Foundation

struct Warehouse: Decodable{
    var warehouseId: UUID
    var address: String
    var latitude: Float
    var longitude: Float
}

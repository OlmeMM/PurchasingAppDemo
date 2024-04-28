//
//  Warehouse.swift
//  InternalPurchasingApp
//
//  Created by Olme Matias Molina on 4/27/24.
//

import Foundation

struct Warehouse: Decodable{
    var warehouseId: UUID
    var address: String
    var latitude: Float
    var longitude: Float
}

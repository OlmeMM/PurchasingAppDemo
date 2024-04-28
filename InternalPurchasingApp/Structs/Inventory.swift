//
//  Inventory.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/25/24.
//

import Foundation

struct Inventory: Decodable{
    var id: Int
    var warehouseId: UUID
    var productId: Int?
    var stock: Int?
}

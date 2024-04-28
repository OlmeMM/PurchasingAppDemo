//
//  Inventory.swift
//  InternalPurchasingApp
//
//  Created by Olme Matias Molina on 4/27/24.
//

import Foundation

struct Inventory: Decodable{
    var id: Int
    var warehouseId: UUID
    var productId: Int?
    var stock: Int?
}

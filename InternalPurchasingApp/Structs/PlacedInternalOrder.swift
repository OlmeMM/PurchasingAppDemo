//
//  PlacedInternalOrder.swift
//  InternalPurchasingApp
//
//  Created by Olme Matias Molina on 4/27/24.
//

import Foundation

struct PlacedInternalOrder: Decodable{
    var placedOrder: InternalOrder
    var placedOrderItems: [InternalOrderItem]
}

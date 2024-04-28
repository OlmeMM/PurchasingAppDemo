//
//  PlacedInternalOrder.swift
//  InternalPurchasingApp
//
//  Created by Olme Matias Molina on 4/27/24.
// 

import Foundation

struct PlacedInternalOrder: Decodable, Encodable {
    var placedOrder: InternalOrder
    var orderId: Float
    var placedOrderItems: [InternalOrderItem]
    var productName: String
}

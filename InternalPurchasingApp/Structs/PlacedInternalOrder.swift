//
//  PlacedInternalOrder.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/25/24.
//

import Foundation

struct PlacedInternalOrder: Decodable{
    var placedOrder: InternalOrder
    var placedOrderItems: [InternalOrderItem]
}

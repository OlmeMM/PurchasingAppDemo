//
//  InternalOrderItem.swift
//  InternalPurchasingApp
//
//  Created by Jannett Arredondo on 4/25/24.
//

import Foundation

struct InternalOrderItem: Decodable{
    var id: Int?
    var internalOrderId: Int?
    var productId: Int?
    var status: Int?
    var createdAt: Date?
    var updatedAt: Date?
    var deactivatedAt: Date?
}

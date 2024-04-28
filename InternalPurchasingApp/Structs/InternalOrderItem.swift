//
//  InternalOrderItem.swift
//  InternalPurchasingApp
//
//  Created by Olme Matias Molina on 4/27/24.
//

import Foundation

struct InternalOrderItem: Decodable, Encodable, Identifiable {
    var id: Int?
    var internalOrderId: Int?
    var productId: Int?
    var status: Int?
    var createdAt: Date?
    var updatedAt: Date?
    var deactivatedAt: Date?
}

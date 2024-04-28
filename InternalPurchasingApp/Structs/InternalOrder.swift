//
//  InternalOrder.swift
//  InternalPurchasingApp
//
//  Created by Olme Matias Molina on 4/25/24.
//

import Foundation

struct InternalOrder: Decodable{
    var id: Int
    var totalAmount: Float?
    var statusId: Int?
    var deliveryDate: Date?
    var notes: String?
    var createdAt: Date?
    var updatedAt: Date?
    var deactivatedAt: Date?
}

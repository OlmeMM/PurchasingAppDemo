//
//  InternalOrder.swift
//  InternalPurchasingApp
//
//  Created by Olme Matias Molina on 4/25/24.
//

import Foundation

struct InternalOrder: Decodable, Identifiable, Encodable{
    var id: Int 
    var totalAmount: Float
    var statusId: Int
    var notes: String
}

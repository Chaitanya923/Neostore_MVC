//
//  Orders.swift
//  NeoSTORE
//
//  Created by Neosoft on 28/12/21.
//

import Foundation

// MARK: - OrdersResponse
struct OrdersResponse: Codable {
    let status: Int
    let data: [OrderModel]
    let message, userMsg: String

    enum CodingKeys: String, CodingKey {
        case status, data, message
        case userMsg = "user_msg"
    }
}

// MARK: - OrderModel
struct OrderModel: Codable {
    let id, cost: Int
    let created: String
}

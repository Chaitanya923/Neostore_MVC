//
//  Cart.swift
//  NeoSTORE
//
//  Created by Neosoft on 26/12/21.
//

import Foundation

// MARK: - Cart
struct CartResponse: Codable {
    let status: Int
    let data: [CartProduct]
    let count: Int
    let total: Double
}

// MARK: - CartProduct
struct CartProduct: Codable {
    let id, productID, quantity: Int
    let product: CartProductDetails

    enum CodingKeys: String, CodingKey {
        case id
        case productID = "product_id"
        case quantity, product
    }
}

// MARK: - CartProductDetails
struct CartProductDetails: Codable {
    let id: Int
    let name: String
    let cost: Int
    let productCategory: String
    let productImages: String
    let subTotal: Int

    enum CodingKeys: String, CodingKey {
        case id, name, cost
        case productCategory = "product_category"
        case productImages = "product_images"
        case subTotal = "sub_total"
    }
}

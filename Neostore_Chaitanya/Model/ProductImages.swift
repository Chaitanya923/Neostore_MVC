//
//  ProductImages.swift
//  NeoSTORE
//
//  Created by Neosoft on 20/12/21.
//

import Foundation

// MARK: - ProductImage
struct ProductImage: Codable {
    let id, productID: Int
    let image: String
    let created, modified: String

    enum CodingKeys: String, CodingKey {
        case id
        case productID = "product_id"
        case image, created, modified
    }
    
    
}

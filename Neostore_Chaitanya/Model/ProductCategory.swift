//
//  ProductCategory.swift
//  NeoSTORE
//
//  Created by Neosoft on 24/12/21.
//

import Foundation

// MARK: - ProductCategory
struct ProductCategoryModel: Codable {
    let id: Int
    let name: String
    let iconImage: String
    let created, modified: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case iconImage = "icon_image"
        case created, modified
    }
}

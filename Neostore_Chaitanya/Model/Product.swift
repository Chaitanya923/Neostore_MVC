//
//  Product.swift
//  NeoSTORE
//
//  Created by Neosoft on 20/12/21.
//

import Foundation

// MARK: - Product Model
struct ProductModel: Codable {
    let id, productCategoryID: Int
    let name, producer, welcomeDescription: String
    let cost, rating, viewCount: Int
    let created, modified: String
    let productImages: String

    enum CodingKeys: String, CodingKey {
        case id
        case productCategoryID = "product_category_id"
        case name, producer
        case welcomeDescription = "description"
        case cost, rating
        case viewCount = "view_count"
        case created, modified
        case productImages = "product_images"
    }
    
    
    static var dummyDatas: [ProductModel] {
        
        let stringData = "[{\"id\": 1,\"product_category_id\": 1,\"name\": \"Centre Coffee Table\",\"producer\": \"Luna\",\"description\": \"Mild Steel Base In Poder Coated White Finish.8 mm Tempered Glass Table Top.Bottom Shelf In Paimted Brown Glass.\",\"cost\": 5000,\"rating\": 2,\"view_count\": 28015,\"created\": \"2015-09-07T09:24:05+0000\",\"modified\": \"2021-12-20T08:04:55+0000\",\"product_images\": \"http://staging.php-dev.in:8844/trainingapp/uploads/prod_img/thumb/medium/9dc6234da018916e545011fa1.jpeg\"},{\"id\": 2,\"product_category_id\": 1,\"name\": \"Metal Coffee Table\",\"producer\": \"Luna\",\"description\": \"Mild Steel Base In Poder Coated White Finish.8 mm Tempered Glass Table Top.Bottom Shelf In Paimted Brown Glass.\",\"cost\": 5000,\"rating\": 2,\"view_count\": 28015,\"created\": \"2015-09-07T09:24:05+0000\",\"modified\": \"2021-12-20T08:04:55+0000\",\"product_images\": \"http://staging.php-dev.in:8844/trainingapp/uploads/prod_img/thumb/medium/b289043c1a85cde66f5f36484.jpeg\"}]"
        do {
            guard let data = stringData.data(using: .utf8) else {
                print("Error in Json Conversion")
                return []
            }
            let f = try JSONDecoder().decode([ProductModel].self, from: data)
            return f
        } catch let error {
            print(error)
            return []
        }
        
    }
}

struct ProductResponse: Codable {
    let status: Int
    let data: [ProductModel]
}

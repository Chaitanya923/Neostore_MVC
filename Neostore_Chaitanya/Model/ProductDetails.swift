//
//  ProductDetails.swift
//  NeoSTORE
//
//  Created by Neosoft on 20/12/21.
//

import Foundation

// MARK: - ProductDetails
struct ProductDetails: Codable {
    let id, productCategoryID: Int
    let name, producer, description: String
    let cost, rating, viewCount: Int
    let created, modified: String
    let productImages: [ProductImage]

    enum CodingKeys: String, CodingKey {
        case id
        case productCategoryID = "product_category_id"
        case name, producer
        case description = "description"
        case cost, rating
        case viewCount = "view_count"
        case created, modified
        case productImages = "product_images"
    }
    
    static var dummyData: ProductDetails? {
        let strData = "{\"id\": 1, \"product_category_id\": 1, \"name\": \"Centre Coffee Table\",\"producer\": \"Luna\", \"description\": \"Mild Steel Base In Poder Coated White Finish.8 mm Tempered Glass Table Top.Bottom Shelf In Paimted Brown Glass.\",\"cost\": 5000, \"rating\": 2, \"view_count\": 28018, \"created\": \"2015-09-07T09:24:05+0000\",\"modified\": \"2021-12-20T10:58:39+0000\",\"product_images\": [{ \"id\": 1, \"product_id\": 1, \"image\": \"http://staging.php-dev.in:8844/trainingapp/uploads/prod_img/thumb/medium/9dc6234da018916e545011fa1.jpeg\", \"created\": \"2015-09-07T09:40:00+0000\", \"modified\": \"2015-09-07T09:40:00+0000\"},{\"id\": 6,\"product_id\": 1, \"image\": \"http://staging.php-dev.in:8844/trainingapp/uploads/prod_img/thumb/medium/1bfdac02ced672dd1e8e8976c.jpeg\", \"created\": \"2015-09-07T09:44:11+0000\",\"modified\": \"2015-09-07T09:44:11+0000\"}]}"
        
        do {
            guard let data = strData.data(using: .utf8) else {
                print("Error in Json Conversion")
                return nil
            }
            let f = try JSONDecoder().decode(ProductDetails.self, from: data)
            return f
        } catch let error {
            print(error)
            return nil
        }
    }
}

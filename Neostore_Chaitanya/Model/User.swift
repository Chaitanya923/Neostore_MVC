//
//  File.swift
//  NeoSTORE
//
//  Created by Neosoft on 22/12/21.
//

import Foundation

struct UserModel: Codable{
    var firstName, lastName, email, password, confirmPassword, gender: String
    var phoneNo: Int
    
    init(firstName: String, lastName: String, email: String, password: String, confirmPassword: String, isMale: Bool, phoneNo: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
        self.gender = isMale ? "M" : "F"
        self.phoneNo = Int(phoneNo) ?? 0
    }
    private enum CodingKeys : String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case email = "email"
        case password = "password"
        case confirmPassword = "confirm_password"
        case gender = "gender"
        case phoneNo = "phone_no"
    }
}


// MARK: - UserDetails
struct UserDetailsModel: Codable {
    let id, roleID: Int
    let firstName, lastName, email, username: String
    let profilePic: String?
    let countryID: JSONNull?
    let gender: String
    let phoneNo: String
    let dob: String?
    let isActive: Bool
    let created, modified: String
    let accessToken: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case roleID = "role_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case email, username
        case profilePic = "profile_pic"
        case countryID = "country_id"
        case gender
        case phoneNo = "phone_no"
        case dob
        case isActive = "is_active"
        case created, modified
        case accessToken = "access_token"
    }
}

// MARK: - Welcome
struct RegisterResponse: Codable {
    let status: Int
    let data: UserDetailsModel?
    let message, userMsg: String
    
    enum CodingKeys: String, CodingKey {
        case status, data, message
        case userMsg = "user_msg"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}


// MARK: - UserResponse
struct UserMoreDetailsModel: Codable {
    let userData: UserDetailsModel
    let productCategories: [ProductCategoryModel]
    let totalCarts, totalOrders: Int
    
    enum CodingKeys: String, CodingKey {
        case userData = "user_data"
        case productCategories = "product_categories"
        case totalCarts = "total_carts"
        case totalOrders = "total_orders"
    }
}

struct UserResponse: Codable {
    let status: Int
    let data: UserMoreDetailsModel
}

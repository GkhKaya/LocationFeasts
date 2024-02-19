// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let resultModel = try? JSONDecoder().decode(ResultModel.self, from: jsonData)

import Foundation

// MARK: - ResultModel
struct ResultModel: Codable {
    let businesses: [Business]?
    let total: Int?
    let region: Region?
}

// MARK: - Business
struct Business: Codable {
    let id, alias, name: String?
    let imageURL: String?
    let isClosed: Bool?
    let url: String?
    let reviewCount: Int?
    let categories: [Category]?
    let rating: Double?
    let coordinates: Center?
    let transactions: [JSONAny]?
    let price: String?
    let location: Location?
    let phone, displayPhone: String?
    let distance: Double?

    enum CodingKeys: String, CodingKey {
        case id, alias, name
        case imageURL = "image_url"
        case isClosed = "is_closed"
        case url
        case reviewCount = "review_count"
        case categories, rating, coordinates, transactions, price, location, phone
        case displayPhone = "display_phone"
        case distance
    }
}



// MARK: - Center
struct Center: Codable {
    let latitude, longitude: Double?
}



// MARK: - Region
struct Region: Codable {
    let center: Center?
}


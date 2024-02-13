//
//  YelpResultByIdModel.swift
//  LocationFeasts
//
//  Created by Gokhan Kaya on 12.02.2024.
//




// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let yelpResultByIDModel = try? JSONDecoder().decode(YelpResultByIDModel.self, from: jsonData)

import Foundation

// MARK: - YelpResultByIDModel
struct YelpResultByIDModel: Codable {
    let byIdbusinesses: [ByIdbusinesses]?
}

struct ByIdbusinesses: Codable {
    let id, alias, name: String?
    let imageURL: String?
    let isClaimed, isClosed: Bool?
    let url: String?
    let phone, displayPhone: String?
    let reviewCount: Int?
    let categories: [ByIdCategory]?
    let rating: Double?
    let location: ByIdLocation?
    let coordinates: ByIdCoordinates?
    let photos: [String]?
    let price: String?
    let hours: [Hour]?
    let transactions: [JSONAny]?

    enum CodingKeys: String, CodingKey {
        case id, alias, name
        case imageURL = "image_url"
        case isClaimed = "is_claimed"
        case isClosed = "is_closed"
        case url, phone
        case displayPhone = "display_phone"
        case reviewCount = "review_count"
        case categories, rating, location, coordinates, photos, price, hours, transactions
}
    
    }


// MARK: - Category
struct ByIdCategory: Codable {
    let alias, title: String?
}

// MARK: - Coordinates
struct ByIdCoordinates: Codable {
    let latitude, longitude: Double?
}

// MARK: - Hour
struct Hour: Codable {
    let hourOpen: [Open]?
    let hoursType: String?
    let isOpenNow: Bool?

    enum CodingKeys: String, CodingKey {
        case hourOpen = "open"
        case hoursType = "hours_type"
        case isOpenNow = "is_open_now"
    }
}

// MARK: - Open
struct Open: Codable {
    let isOvernight: Bool?
    let start, end: String?
    let day: Int?

    enum CodingKeys: String, CodingKey {
        case isOvernight = "is_overnight"
        case start, end, day
    }
}

// MARK: - Location
struct ByIdLocation: Codable {
    let address1, address2,address3: String?
    let city, zipCode, country, state: String?
    let displayAddress: [String]?
    let crossStreets: String?

    enum CodingKeys: String, CodingKey {
        case address1, address2, address3, city
        case zipCode = "zip_code"
        case country, state
        case displayAddress = "display_address"
        case crossStreets = "cross_streets"
    }
}


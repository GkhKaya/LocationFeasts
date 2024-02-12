//
//  CityModel.swift
//  LocationFeasts
//
//  Created by Gokhan Kaya on 12.02.2024.
//

import Foundation


struct CityModel: Codable {
    let error: Bool?
    let msg: String?
    let data: [Datum]?
}

// MARK: - Datum
struct Datum: Codable {
    let city, country: String?
}

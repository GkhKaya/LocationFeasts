//
//  LocalKeys.swift
//  Walletly
//
//  Created by Gokhan Kaya on 1.10.2023.
//

import SwiftUI

struct LocalKeys {
    enum Home : String{
        case findNearbyRestaurants = "findNearbyRestaurants"
        case whichFoodDoYouWantToFind = "whichFoodDoYouWantToFind"
        case cheapRestaurant = "cheapRestaurant"
        case expensiveRestaurant = "expensiveRestaurant"
        case mediumPricedRestaurant = "mediumPricedRestaurant"
        case location = "location"
        case isClosed = "isClosed"
        case rating = "rating"
        case address = "address"
    }
}

extension String{
    /// It localize any string from Localizable string
    /// - Returns: localized value
    func locale() -> LocalizedStringKey {
        return LocalizedStringKey(self)
    }
}

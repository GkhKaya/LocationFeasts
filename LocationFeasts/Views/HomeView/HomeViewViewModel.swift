//
//  HomeViewViewModel.swift
//  LocationFeasts
//
//  Created by Gokhan Kaya on 7.02.2024.
//

import Foundation
import SwiftUI
import Alamofire
final class HomeViewViewModel : ObservableObject{
    @Published var term: String {
        didSet {
            UserDefaults.standard.set(term, forKey: "savedTerm")
        }
    }
    @Published var resultData : ResultModel?
    @Published var location  : String = ""
    let networkManager  = NetworkManager()
    
    init(term: String = "kebap") {
        self.term = UserDefaults.standard.string(forKey: "savedTerm") ?? term
    }
    
    
    func getResultData() async {
        
        let headers : HTTPHeaders=[
            .authorization(RestApiKey.key)
        ]
        let paramaters: Parameters=[
            "location" : "newyork",
            "term": term
        ]
        
        do{
            let result = try await networkManager.fetchResult(url: "https://api.yelp.com/v3/businesses/search",headers: headers,parameters: paramaters,type: ResultModel.self)
            self.resultData = result
            print(result?.businesses)
        }catch(let error){
            print(error.localizedDescription)
        }
    }
    
    func filterData(withCount wantCount: Int,price:String?) -> Bool {
        guard let rPrice = price else { return false }
        let characterArray = rPrice.map { String($0) }
        let count = characterArray.count
        return count == wantCount
        
    }
}



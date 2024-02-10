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
    @Published var terms: String = ""
    @Published var resultData : ResultModel?
    let location  : String? = nil
    let term: String? = nil
    
    let networkManager  = NetworkManager()
    
    
    
    func getResultData() async throws{
        
        let headers : HTTPHeaders=[
            .authorization(RestApiKey.key)
        ]
        let paramaters: Parameters=[
            "location" : location,
            "term": term
        ]
        
        do{
            let resultData = try await networkManager.fetchResult(url: "https://api.yelp.com/v3/businesses/search",headers: headers,parameters: paramaters,type: ResultModel.self)
            self.resultData = resultData
        }catch(let error){
            print(error.localizedDescription)
        }
        
    }
    
}

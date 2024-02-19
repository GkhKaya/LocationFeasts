//
//  DetailViewModel.swift
//  LocationFeasts
//
//  Created by Gokhan Kaya on 14.02.2024.
//

import Foundation
import Alamofire

final class DetailViewModel:ObservableObject{
    @Published var resultData : YelpResultByIDModel?
    let networkManager = NetworkManager()
    @Published var id : String? 
    @Published var goToMap : Bool = false
    
    let headers : HTTPHeaders=[
        .authorization(RestApiKey.key)
    ]
    
    func getResultData(id:String) async{
        let url = "https://api.yelp.com/v3/businesses/\(id)"
        do{
            let result = try await networkManager.fetchResult(url: url, headers: headers, parameters: nil, type: YelpResultByIDModel.self)
            self.resultData = result
        }catch{
            print(error.localizedDescription)
        }
    }
}

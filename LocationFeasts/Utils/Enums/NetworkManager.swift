//
//  NetworkManager.swift
//  LocationFeasts
//
//  Created by Gokhan Kaya on 7.02.2024.
//

import Foundation
import Alamofire
final class NetworkManager{

    func fetchResult(location:String,terms:String) async throws -> ResultModel?{

        let headers : HTTPHeaders=[
            .authorization(RestApiKey.key)
        ]

        let dataRequest  = AF.request("https://api.yelp.com/v3/businesses/search?terms=\(terms)&location=\(location)",method: .get,headers: headers)
            .validate()
            .serializingDecodable(ResultModel.self)

        let result  = await dataRequest.response

        guard let value = result.value else{
            print("Error : (String(describing:result.error))")
            return nil
        }
        return value

    }
}

//
//  NetworkManager.swift
//  LocationFeasts
//
//  Created by Gokhan Kaya on 7.02.2024.
//

import Foundation
import Alamofire

protocol INetworkManager{
    func fetchResult<T:Codable>(url:String,headers:HTTPHeaders?,parameters: Parameters?,type:T.Type) async throws ->T?
}

final class NetworkManager : INetworkManager{
    
    func fetchResult<T:Codable>(url:String,headers:HTTPHeaders? ,parameters: Parameters?,type:T.Type) async throws -> T?{

        let dataRequest  = AF.request(url, method: .get,parameters: parameters,headers: headers)
            .validate()
            .serializingDecodable(T.self)

        let result  = await dataRequest.response

        guard let value = result.value else{
            print("Error : \(String(describing:result.error))")
            return nil
        }
        return value

    }
}

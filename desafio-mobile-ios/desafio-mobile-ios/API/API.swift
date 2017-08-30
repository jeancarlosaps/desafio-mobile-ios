//
//  API.swift
//  desafio-mobile-ios
//
//  Created by Jean Carlos on 8/29/17.
//  Copyright © 2017 Jean Carlos. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class API{
    
    func getRepositoriesAPI(_ page:Int, completion: @escaping ([Repositorie]) -> Void) {
        let url : String = String(format: "https://api.github.com/search/repositories?q=language:Java&sort=stars&page=%i", page)
        
        Alamofire.request(url).validate().responseObject { (response : DataResponse<Repositories>) in
            switch response.result {
            case .success:
                if let responseData = response.result.value{
                    // devolve para a classe que chamou o resultado:
                    completion(responseData.items!)
                }else{
                    
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getPullRequests(_ pullRequestCreator:String, pullRequestRepository:String, completion: @escaping ([PullRequests]) -> Void) {
        
        let url:String = "https://api.github.com/repos/\(pullRequestCreator)/\(pullRequestRepository)/pulls"
        
        Alamofire.request(url).validate().responseArray { (response : DataResponse<[PullRequests]>) in
            switch response.result{
            case .success:
                if let responseData = response.result.value{
                    completion(responseData)
                }else{
                    
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

//
//  Repositorie.swift
//  desafio-mobile-ios
//
//  Created by Jean Carlos on 8/29/17.
//  Copyright © 2017 Jean Carlos. All rights reserved.
//

import Foundation
import ObjectMapper

class Repositorie: Mappable{
    var id: Int? = 0
    var nameRepositories: String? = ""
    var full_name: String? = ""
    var description: String? = ""
    var owner: String? = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        nameRepositories <- map["nameRepositories"]
        full_name <- map["full_name"]
        description <- map["description"]
        owner <- map["owner"]
    }
}

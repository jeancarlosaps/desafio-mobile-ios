//
//  RepositorieOwner.swift
//  desafio-mobile-ios
//
//  Created by Jean Carlos on 8/29/17.
//  Copyright © 2017 Jean Carlos. All rights reserved.
//

import Foundation
import ObjectMapper

class RepositorieOwner: Mappable{
    var login: String?
    var avatarURL: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        login <- map["login"]
        avatarURL <- map["avatar_url"]
    }
}

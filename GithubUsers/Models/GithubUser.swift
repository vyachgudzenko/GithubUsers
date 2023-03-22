//
//  GithubUser.swift
//  GithubUsers
//
//  Created by Вячеслав Гудзенко on 22.03.2023.
//

import Foundation

struct GithubUser:Decodable{
    var login:String
    var avatarUrl:String
    
    enum CodingKeys: String, CodingKey{
        case login = "login"
        case avatarUrl = "avatar_url"
    }
}

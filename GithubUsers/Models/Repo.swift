//
//  Repo.swift
//  GithubUsers
//
//  Created by Вячеслав Гудзенко on 22.03.2023.
//

import Foundation

struct Repo:Decodable{
    var name:String
    var url:String
    
    enum CodingKeys: String, CodingKey{
        case name = "name"
        case url = "html_url"
    }
}

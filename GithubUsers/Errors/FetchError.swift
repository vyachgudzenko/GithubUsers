//
//  FetchError.swift
//  GithubUsers
//
//  Created by Вячеслав Гудзенко on 22.03.2023.
//

import Foundation

enum FetchError:Error{
    case badURL
    case badRequest(Int)
    case badJSON
    case genericError(String)
    
    var errorMessage:String{
        switch self {
        case .badURL:
            return "Invalid URL encountered. Can't proceed with the request"
        case .badRequest(let responseCode):
            return "Invalid response code encountered from the server. Expected 200, received \(responseCode)"
        case .badJSON:
            return "Encountered an error while decoding incoming server response. The data couldn’t be read because it isn’t in the correct format."
        case .genericError(let message):
            return message
        }
    }
}

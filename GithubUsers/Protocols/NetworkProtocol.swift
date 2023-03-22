//
//  NetworkProtocol.swift
//  GithubUsers
//
//  Created by Вячеслав Гудзенко on 22.03.2023.
//

import Foundation
import Combine

protocol NetworkCombineProtocol{
    func createRequest<T:Decodable>(urlString:String, typeOfData: T.Type)  -> AnyPublisher<T,FetchError>
}

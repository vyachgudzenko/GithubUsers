//
//  Network.swift
//  GithubUsers
//
//  Created by Вячеслав Гудзенко on 22.03.2023.
//

import Foundation
import Combine

class CombineNetwork:NetworkCombineProtocol{
    
    struct EmptyParams:Encodable {}
    
    func createRequest<T:Decodable>(
        urlString:String,
        typeOfData: T.Type) -> AnyPublisher<T,FetchError> {
        guard let url = URL(string: urlString) else {
            return Fail(error: FetchError.badURL).eraseToAnyPublisher() }
        var urlRequest = URLRequest(url: url)
            return URLSession.shared.dataTaskPublisher(for: urlRequest)
                .tryMap { (data, response) -> Data in
                    if let httpResponse = response as? HTTPURLResponse{
                        guard (200..<300) ~= httpResponse.statusCode else {
                            throw FetchError.badRequest(httpResponse.statusCode)
                        }
                    }
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .mapError { error -> FetchError in
                    if error is DecodingError{
                        return FetchError.badJSON
                    }
                    return FetchError.genericError(error.localizedDescription)
                }
                .receive(on: RunLoop.main)
                .eraseToAnyPublisher()
    }
    
}

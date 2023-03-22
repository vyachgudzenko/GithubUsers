//
//  GithubUsersViewModel.swift
//  GithubUsers
//
//  Created by Вячеслав Гудзенко on 22.03.2023.
//

import SwiftUI
import Combine

class GithubUsersViewModel:CombineNetwork,ObservableObject{
    @Published var users:[GithubUser] = []
    private var anyCancellables = Set<AnyCancellable>()
    
    let usersUrl:String = "https://api.github.com/users"
    
    override init(){
        super.init()
        createRequest(urlString: usersUrl, typeOfData: [GithubUser].self)
            .sink { completion in
                switch completion{
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    break
                }
            } receiveValue: { users in
                self.users = users
            }
            .store(in: &anyCancellables)
    }
}

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
    @Published var repos:[Repo] = []
    @Published var currentUser:GithubUser? = nil
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
    
    func fetchRepos(userName:String){
        createRequest(urlString: "https://api.github.com/users/\(userName)/repos", typeOfData: [Repo].self)
            .sink { completion in
                switch completion{
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    break
                }
            } receiveValue: { repos in
                self.repos  = repos
            }
            .store(in: &anyCancellables)
    }
}

//
//  UserReposView.swift
//  GithubUsers
//
//  Created by Вячеслав Гудзенко on 22.03.2023.
//

import SwiftUI

struct UserReposView: View {
    let user:GithubUser
    @EnvironmentObject var githubUsersVM:GithubUsersViewModel
    @State private var repos:[Repo] = []
    
    var body: some View {
        VStack{
            ScrollView {
                ForEach(githubUsersVM.repos, id: \.name){
                    repo in
                    VStack{
                        RepoRow(repo: repo)
                        Divider()
                    }
                    .onTapGesture {
                        openRepoInBrowser(repo: repo)
                    }
                }
            }
        }
        .onAppear(perform: {
            githubUsersVM.fetchRepos(userName: user.login)
        })
        .navigationTitle(user.login)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func openRepoInBrowser(repo:Repo){
        guard let url = URL(string: repo.url) else { return }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [ : ] , completionHandler: nil)
            
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}

struct UserReposView_Previews: PreviewProvider {
    static var previews: some View {
        UserReposView(user: GithubUser(login: "mojombo", avatarUrl: "https://avatars.githubusercontent.com/u/1?v=4"))
            .environmentObject(GithubUsersViewModel())
    }
}

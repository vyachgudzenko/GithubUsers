//
//  HomeView.swift
//  GithubUsers
//
//  Created by Вячеслав Гудзенко on 22.03.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var githubUsersVM = GithubUsersViewModel()
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVStack {
                    ForEach(githubUsersVM.users, id: \.login) {
                        user in
                        NavigationLink {
                            UserReposView(user: user)
                                .environmentObject(githubUsersVM)
                        } label: {
                            VStack{
                                UserRow(user: user, isFavorite: false, closure: { print("its work") })
                                Divider()
                            }
                        }

                        
                    }
                }
            }
            .navigationTitle("Github Users")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

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
        ScrollView{
            LazyVStack {
                ForEach(githubUsersVM.users, id: \.login) {
                    user in
                    VStack{
                        UserRow(user: user, isFavorite: false)
                        Divider()
                    }
                    
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

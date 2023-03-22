//
//  HomeView.swift
//  GithubUsers
//
//  Created by Вячеслав Гудзенко on 22.03.2023.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
       sortDescriptors: [NSSortDescriptor(keyPath: \FavoriteUser.createDate, ascending: true)],
        animation: .default)
    private var items: FetchedResults<FavoriteUser>
    
    @EnvironmentObject var githubUsersVM:GithubUsersViewModel
    
    @State private var isError:Bool = false
    @State private var errorText:String = ""
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVStack {
                    ForEach(githubUsersVM.users, id: \.login) {
                        user in
                        NavigationLink {
                            UserReposView(userName: user.login)
                                .environmentObject(githubUsersVM)
                        } label: {
                            VStack{
                                UserRow(login: user.login, avatarUrl: user.avatarUrl, isFavorite: isFavorite(user: user)) {
                                    workWithFavotite(user: user)
                                }
                                Divider()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Github Users")
            .navigationBarTitleDisplayMode(.large)
            .alert(errorText, isPresented: $isError) {
                Button {
                    
                } label: {
                    Text("OK")
                }

            }
        }
    }
    
    private func workWithFavotite(user:GithubUser){
        if isFavorite(user: user) {
            do{
                try  PersistenceController.shared.deleteFavoriteUser(userName: user.login, favorites: items.map({ $0 }))
            } catch {
                errorText = "Failed to delete user from favorites"
                isError = true
            }
        } else {
            do{
                try PersistenceController.shared.createFavoriteUser(user: user)
            } catch {
                errorText = "Failed to add user to favorites"
                isError = true
            }
        }
    }
    
    func isFavorite(user:GithubUser) -> Bool{
        return items.contains { $0.userName == user.login }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(GithubUsersViewModel())
    }
}

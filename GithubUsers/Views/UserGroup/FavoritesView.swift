//
//  FavoritesView.swift
//  GithubUsers
//
//  Created by Вячеслав Гудзенко on 22.03.2023.
//

import SwiftUI

struct FavoritesView: View {
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
            ScrollView {
                ForEach(items, id: \.createDate){
                    favoriteUser in
                    NavigationLink {
                        UserReposView(userName: favoriteUser.userName!)
                            .environmentObject(githubUsersVM)
                    } label: {
                        VStack{
                            UserRow(login: favoriteUser.userName ?? "Unknown", avatarUrl: favoriteUser.avatar ?? "", isFavorite: true) {
                                do{
                                   try PersistenceController.shared.deleteFavoriteUser(userName: favoriteUser.userName!, favorites: items.map({ $0 }))
                                } catch {
                                    errorText = "Failed to delete user from favorites"
                                    isError = true
                                }
                            }
                            Divider()
                        }
                    }

                }
                
            }
            .navigationTitle("Favorites Users")
            .navigationBarTitleDisplayMode(.large)
        }
        
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}

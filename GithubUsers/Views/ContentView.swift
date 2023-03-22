//
//  ContentView.swift
//  GithubUsers
//
//  Created by Вячеслав Гудзенко on 22.03.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var githubUsersVM = GithubUsersViewModel()
    
    @State var selectionTab:Int = 1
    var body: some View {
        
        TabView{
            HomeView()
                .tabItem {
                    getTabItem(title: "Home", image: "house")
                }
                .environmentObject(githubUsersVM)
            FavoritesView()
                .tabItem {
                    getTabItem(title: "Favorites", image: "heart")
                }
                .environmentObject(githubUsersVM)
        }
        
    }
    
    @ViewBuilder
    private func getTabItem(title:String,image:String) -> some View{
        VStack{
            Text(title)
            Image(systemName: image)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}

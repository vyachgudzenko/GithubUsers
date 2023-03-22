//
//  ContentView.swift
//  GithubUsers
//
//  Created by Вячеслав Гудзенко on 22.03.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @State var selectionTab:Int = 1
    var body: some View {
        
        TabView(selection: $selectionTab) {
            HomeView()
                .tabItem {
                    getTabItem(title: "Home", image: "house")
                }
                .tag(1)
            FavoritesView()
                .tabItem {
                    getTabItem(title: "Favorites", image: "heart")
                }
                .tag(1)
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
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

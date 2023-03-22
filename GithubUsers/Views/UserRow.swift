//
//  UserRow.swift
//  GithubUsers
//
//  Created by Вячеслав Гудзенко on 22.03.2023.
//

import SwiftUI

struct UserRow: View {
    let user:GithubUser
    let isFavorite:Bool
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: user.avatarUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:64,height: 64)
                    .clipShape(Circle())
            } placeholder: {
                Image("githubPlaceholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:64,height: 64)
                    .clipShape(Circle())
            }
            Text(user.login)
                .font(.system(size: 32,weight: .semibold))
            Spacer()
            Image(systemName: isFavorite ? "trash" : "heart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:40,height: 40)
                .foregroundColor(isFavorite ? .red : .orange)
        }
        .padding(.horizontal,20)
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        UserRow(user: GithubUser(login: "mojombo", avatarUrl: "https://avatars.githubusercontent.com/u/1?v=4"), isFavorite: false)
    }
}

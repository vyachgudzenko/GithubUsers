//
//  UserRow.swift
//  GithubUsers
//
//  Created by Вячеслав Гудзенко on 22.03.2023.
//

import SwiftUI

struct UserRow: View {
    let login:String
    let avatarUrl:String
    let isFavorite:Bool
    let closure:() -> Void
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: avatarUrl)) { image in
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
            Text(login)
                .font(.system(size: 32,weight: .semibold))
                .foregroundColor(.black)
            Spacer()
            Button {
                closure()
            } label: {
                Image(systemName: isFavorite ? "trash" : "heart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:40,height: 40)
                    .foregroundColor(isFavorite ? .red : .orange)
            }

        }
        .padding(.horizontal,20)
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        UserRow(login: "mojombo" ,avatarUrl: "https://avatars.githubusercontent.com/u/1?v=4", isFavorite: false, closure: {})
    }
}

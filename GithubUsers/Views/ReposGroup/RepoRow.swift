//
//  RepoRow.swift
//  GithubUsers
//
//  Created by Вячеслав Гудзенко on 22.03.2023.
//

import SwiftUI

struct RepoRow: View {
    let repo:Repo
    var body: some View {
        HStack{
            Image("githubPlaceholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:32,height: 32)
            Text(repo.name)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding(.horizontal,20)
    }
}

struct RepoRow_Previews: PreviewProvider {
    static var previews: some View {
        RepoRow(repo: Repo(name: "30daysoflaptops.github.io", url: "https://github.com/mojombo/30daysoflaptops.github.io"))
    }
}

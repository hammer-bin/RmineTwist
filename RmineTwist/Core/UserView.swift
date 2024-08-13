//
//  UserView.swift
//  RmineTwist
//
//  Created by Minkyu Lee on 8/12/24.
//

import SwiftUI

struct UserView: View {
    @StateObject var viewModel = ViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            VStack(spacing: 8) {
                                HStack {
                                    CircularProfileImageView(size: .medium)
                                    
                                    Text(user.data.login)
                                        .font(.headline)
                                        .foregroundStyle(.black)
                                        .frame(width: 100, height: 40)
                                        .background(Color.gray.opacity(0.1))
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                    
                                    Spacer()
                                    
                                    Text(user.data.createdOn.timestampString())
                                        .font(.footnote)
                                        .foregroundStyle(.gray)
                                    Image(systemName: "ellipsis")
                                }
                                .padding(.horizontal, 12)
                                
                                Divider()
                                
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                UserDetail(user: user)
            })
            .navigationTitle("Team Member")
            .searchable(text: $searchText, prompt: "Search")
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    UserView()
}

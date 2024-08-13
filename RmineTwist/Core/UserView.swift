//
//  UserView.swift
//  RmineTwist
//
//  Created by Minkyu Lee on 8/12/24.
//

import SwiftUI

struct UserView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.users) { user in
                    VStack(spacing: 8) {
                        HStack {
                            Image(systemName: "phone")
                            
                            Text(user.data.login)
                                .font(.headline)
                                .frame(width: 100, height: 20)
                                .background(Color.gray.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                            
                    }
                }
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    UserView()
}

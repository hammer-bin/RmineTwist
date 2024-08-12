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
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        VStack {
                            Text(user.specversion)
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

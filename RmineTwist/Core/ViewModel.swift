//
//  ViewModel.swift
//  RmineTwist
//
//  Created by Minkyu Lee on 8/12/24.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchUsers() }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        print("DEBUG: run to fetchUsers()")
        self.users = try await UserService.fetchUsers()
    }
}

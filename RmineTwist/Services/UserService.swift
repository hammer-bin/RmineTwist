//
//  UserService.swift
//  RmineTwist
//
//  Created by Minkyu Lee on 8/12/24.
//

import FirebaseAuth
import FirebaseFirestore

class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        //guard let uid = Auth.auth().currentUser?.uid else { return }
        let uid = "4ebb1a83-0104-4266-bca8-5ee9e7ba595d"
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
    }
    
    static func fetchUsers() async throws -> [User] {
        //guard let currentUid = Auth.auth().currentUser?.uid else { return [] }
        let currentUid = "4ebb1a83-0104-4266-bca8-5ee9e7ba595d"
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap({ try? $0.data(as: User.self) })
        return users.filter({ $0.id != currentUid })
    }
    
    static func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
}


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
    private var allUsers: [Int: User] = [:]
    
    static let shared = UserService()
    
    init() {
        Task {
            try await fetchAllUser()
            try await fetchCurrentUser()
            
        }
        
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        //guard let uid = Auth.auth().currentUser?.uid else { return }
        let uid = "4ebb1a83-0104-4266-bca8-5ee9e7ba595d"
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
    }
    
    @MainActor
    func fetchAllUser() async throws {
        print("DEBUG: fecthAllUser start!")
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap{ try? $0.data(as: User.self)}
        for user in users {
            allUsers[user.data.id] = user
            print("DEBUG: fetchAllUser:: \(user.data.firstName)")
        }
    }
    
    static func fetchUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap({ try? $0.data(as: User.self) })
        return users
    }
    
    @MainActor
    func fetchUser(byDataClassID dataClassID: Int) async throws -> User? {
            let querySnapshot = try await Firestore.firestore().collection("users")
                .whereField("data.ID", isEqualTo: dataClassID)
                .getDocuments()

            guard let document = querySnapshot.documents.first else {
                return nil // If no user with the given ID is found, return nil
            }

            return try document.data(as: User.self)
        }
}


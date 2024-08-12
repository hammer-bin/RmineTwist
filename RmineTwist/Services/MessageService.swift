//
//  MessageService.swift
//  RmineTwist
//
//  Created by Minkyu Lee on 8/12/24.
//

import Foundation
import FirebaseFirestore

class MessageService {
    static let shared = MessageService()
    
    init() {
        
    }
    
    static func fetchMessage2() async throws -> [Message] {
        let snapshot = try await Firestore.firestore()
            .collection("messages")
            .document("message")
            .collection("2").getDocuments()
        let message = snapshot.documents.compactMap({try? $0.data(as: Message.self)})
        return message
    }
}

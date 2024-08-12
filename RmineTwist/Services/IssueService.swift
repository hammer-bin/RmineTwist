//
//  IssueService.swift
//  RmineTwist
//
//  Created by Minkyu Lee on 8/12/24.
//

import Foundation
import FirebaseFirestore

class IssueService {
    static let shared = IssueService()
    
    static func fetchIssue() async throws -> [Issue] {
        let snapshot = try await Firestore.firestore()
            .collection("messages").getDocuments()
        let issue = snapshot.documents.compactMap({try? $0.data(as: Issue.self)})
        return issue
    }
}

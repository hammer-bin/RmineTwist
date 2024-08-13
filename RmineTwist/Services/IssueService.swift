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
        print("DEBUG: fetchIssue()")
        let snapshot = try await Firestore.firestore()
            .collection("issues").getDocuments()
        print("DEBUG: snap count : \(snapshot.count)")
        let issue = snapshot.documents.compactMap({try? $0.data(as: Issue.self)})
        print("DEBUG: issue count : \(issue.count)")
        return issue
    }
}

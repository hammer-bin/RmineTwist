//
//  IssueViewModel.swift
//  RmineTwist
//
//  Created by minkyuLee on 8/13/24.
//

import Foundation

@MainActor
class IssueViewModel: ObservableObject {
    @Published var issues = [Issue]()
    
    init() {
        Task { try await fetchIssue() }
    }
    
    
    private func fetchIssue() async throws {
        print("DEBUG: run to fetchIssue()")
        self.issues = try await IssueService.fetchIssue()
        try await fetchUserDataForIssues()
    }
    
    private func fetchUserDataForIssues() async throws {
        for i in 0 ..< issues.count {
            let issue = issues[i]
            let ownerID = issue.data.authorId
            let issueUser = try await UserService.shared.fetchUser(byDataClassID: ownerID)
            
            issues[i].user = issueUser
        }
    }
}

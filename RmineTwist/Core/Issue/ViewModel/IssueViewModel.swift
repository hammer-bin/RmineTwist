//
//  IssueViewModel.swift
//  RmineTwist
//
//  Created by minkyuLee on 8/13/24.
//

import Foundation

class IssueViewModel: ObservableObject {
    @Published var issues = [Issue]()
    
    init() {
        Task { try await fetchIssue() }
    }
    
    @MainActor
    private func fetchIssue() async throws {
        print("DEBUG: run to fetchIssue()")
        self.issues = try await IssueService.fetchIssue()
    }
}

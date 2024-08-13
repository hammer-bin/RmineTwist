//
//  IssueView.swift
//  RmineTwist
//
//  Created by minkyuLee on 8/13/24.
//

import SwiftUI

struct IssueView: View {
    @StateObject var viewModel = IssueViewModel()
    
    var body: some View {
        LazyVStack {
            ForEach(viewModel.issues) { issue in
                
                IssueItemView(issueData: issue.data)
            }
        }
    }
    
    private struct IssueItemView: View {
        let issueData: IssueData
        
        var body: some View {
            HStack {
                VStack {
                    Circle()
                        .frame(width: 55, height: 55)
                    
                    Text(issueData.author)
                    
                    
                }
                .background(Color.red)
                .frame(width: .infinity)
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray3), lineWidth: 1)
                )
                
                
                Text(issueData.subject)
                    //.frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
            .background(Color.gray)
            
            
        }
    }
}

#Preview {
    IssueView()
}

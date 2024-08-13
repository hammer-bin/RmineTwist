//
//  IssueView.swift
//  RmineTwist
//
//  Created by minkyuLee on 8/13/24.
//

import SwiftUI

struct IssueView: View {
    @StateObject var viewModel = IssueViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.issues) { issue in
                        NavigationLink(value: issue.data) {
                            
                            IssueItemView(issueData: issue.data)
                        }
                    }
                }
            }
            .navigationDestination(for: IssueData.self, destination: { issue in
                IssueDetail()
            })
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
        }
    }
    
    private struct IssueItemView: View {
        let issueData: IssueData
        
        var body: some View {
            HStack(spacing: 3) {
                VStack {
                    Circle()
                        .frame(width: 55, height: 55)
                    
                    Text(issueData.subject)
                    
                    
                }
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray3), lineWidth: 1)
                )
                VStack(alignment: .leading) {
                    Text(issueData.description)
                    Group {
                        Text(issueData.updatedOn.timestampString())
                        Text("할당시간 : \(issueData.estimatedHour)")
                    }
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                    
                }
                .padding()
                
                Spacer()
            }
            .padding(.horizontal, 8)
            .frame(maxWidth: .infinity)
            
            
            
        }
    }
}

#Preview {
    IssueView()
}

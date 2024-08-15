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
                        NavigationLink(value: issue) {
                            
                            IssueItemView(issue: issue)
                            
                        }
                    }
                }
            }
            .refreshable {
                
            }
            .navigationDestination(for: Issue.self, destination: { issue in
                IssueDetail(issue: issue)
                    .navigationBarTitleDisplayMode(.inline)
            })
            .navigationTitle("일감")
            .searchable(text: $searchText, prompt: "Search")
        }
    }
    
    private struct IssueItemView: View {
        let issue: Issue
        
        var body: some View {
            HStack(spacing: 3) {
                VStack {
                    CircularProfileImageView(size: .medium)
                    
                    Text(issue.user?.data.firstName ?? "nil")
                        .foregroundStyle(.black)
                    
                    
                }
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray3), lineWidth: 1)
                )
                VStack(alignment: .leading) {
                    Text(issue.data.subject)
                        .font(.system(size: 16))
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                        .foregroundStyle(.black)
                    Text(issue.data.notes)
                        .font(.system(size: 12))
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .foregroundStyle(.black)
                    Group {
                        Text("할당시간 : \(issue.data.estimatedHour)")
                    }
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                    
                }
                .padding()
                
                Spacer()
                
                VStack {
                    Text(issue.data.updatedOn.timestampString())
                        .foregroundStyle(.gray)
                        .font(.footnote)
                }
                .padding()
            }
            .padding(.horizontal, 8)
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    IssueView()
}

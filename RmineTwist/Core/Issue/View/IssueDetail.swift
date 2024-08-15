//
//  IssueDetail.swift
//  RmineTwist
//
//  Created by minkyuLee on 8/14/24.
//

import SwiftUI

struct IssueDetail: View {
    let issue: Issue
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack(spacing: 8) {
                    CircularProfileImageView(size: .medium)
                    
                    Text(issue.user?.data.firstName ?? "-")
                    Text(issue.user?.data.lastName ?? "-")
                        .font(.footnote)
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("업무 진행률 : 76%")
                        Text("할당된 업무 : 5개")
                    }
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    
                }
                Divider()
                
                HStack {
                    Image(systemName: "square.and.pencil.circle")
                        .font(.system(size: 18))
                        .overlay (
                            Circle()
                                .stroke(Color(.systemGray3), lineWidth: 1)
                                .opacity(0.8)
                        )
                    Text(issue.data.subject)
                        .font(.headline)
                        .fontDesign(.rounded)
                        .lineLimit(1)
                        .padding(8)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                
                Text(issue.data.description)
                
                Divider()
                
                Text(issue.data.notes)
                
            }
            .padding()
        }
    }
}

struct IssueDetail_Preview: PreviewProvider {
    static var previews: some View {
        IssueDetail(issue: dev.issue)
    }
}

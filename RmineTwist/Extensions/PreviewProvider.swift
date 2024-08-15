//
//  PreviewProvider.swift
//  RmineTwist
//
//  Created by minkyuLee on 8/15/24.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let issueData = IssueData(
        assignedToId: 6,
        authorId: 6,
        commentorId: 6,
        createdOn: Timestamp(),
        description: "Secret개발을 위한 Dynamic Secret 기능 테스트",
        doneRatio: 50,
        dueDate: Timestamp(),
        estimatedHour: 50,
        id: 1452,
        jobId: 186,
        notes: "* 기능테스트 수행 / 성공",
        oldValue: "0",
        priorityId: 2,
        projectId: 1,
        propKey: "done_ratio",
        property: "attr",
        rootId: 86,
        startDate: Timestamp(),
        statusId: 2,
        subject: "Vault Secret Operator Dynamic 테스트",
        trackerId: 5,
        updatedOn: Timestamp(),
        value: "50"
    )
    
    let userData = DataClass(id: 6, firstName: "장진영", lastName: "선임", admin: false, login: "jinyung0101", status: 1, createdOn: Timestamp())
    
    lazy var user = User(id: NSUUID().uuidString, objectKey: "rmine_push_data/user/6.json", source: "redmine/user", specversion: "1.0", type: "com.example.user", time: Timestamp(), data: userData)
    
    lazy var issue = Issue(
        id: NSUUID().uuidString,
        objectKey: "rmine/support",
        source: "source",
        specversion: "1.8",
        type: "spec",
        time: Timestamp(),
        data: issueData,
        user: user
    )
}

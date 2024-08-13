//
//  Issue.swift
//  RmineTwist
//
//  Created by Minkyu Lee on 8/12/24.
//

import Foundation
import FirebaseFirestore

struct Issue: Identifiable, Codable, Hashable {
    let id: String
    let objectKey: String
    let source, specversion, type: String
    let time: Timestamp
    let data: IssueData
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case objectKey = "object_key"
        case source, specversion, type
        case time = "time"
        case data = "data"
    }
}

struct IssueData: Identifiable, Codable, Hashable {
    let assignedToId: Int
    let authorId: Int
    let commentorId: Int
    let createdOn: Timestamp
    let description: String
    let doneRatio: Int
    let dueDate: Timestamp
    let estimatedHour: Int
    let id: Int
    let jobId: Int
    let notes: String
    let oldValue: String
    let priorityId: Int
    let projectId: Int
    let propKey: String
    let property: String
    let rootId: Int
    let startDate: Timestamp
    let statusId: Int
    let subject: String
    let trackerId: Int
    let updatedOn: Timestamp
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case assignedToId = "AssignedToID"
        case authorId = "AuthorID"
        case commentorId = "CommentorID"
        case createdOn = "CreatedOn"
        case description = "Description"
        case doneRatio = "DoneRatio"
        case dueDate = "DueDate"
        case estimatedHour = "EstimatedHours"
        case id = "ID"
        case jobId = "JobID"
        case notes = "Notes"
        case oldValue = "OldValue"
        case priorityId = "PriorityID"
        case projectId = "ProjectID"
        case propKey = "PropKey"
        case property = "Property"
        case rootId = "RootID"
        case startDate = "StartDate"
        case statusId = "StatusID"
        case subject = "Subject"
        case trackerId = "TrackerID"
        case updatedOn = "UpdatedOn"
        case value = "Value"
    }
}

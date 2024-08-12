//
//  Issue.swift
//  RmineTwist
//
//  Created by Minkyu Lee on 8/12/24.
//

import Foundation
import FirebaseFirestore

struct Issue: Identifiable, Codable {
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

struct IssueData: Identifiable, Codable {
    let assignee: String
    let author: String
    let commentor: String
    let createdOn: Timestamp
    let description: String
    let doneRatio: Int
    let dueDate: Timestamp
    let estimatedHour: Int
    let id: Int
    let jobId: Int
    let notes: String
    let priority: String
    let startDate: Timestamp
    let status: String
    let subject: String
    
    enum CodingKeys: String, CodingKey {
        case assignee = "Assignee"
        case author = "Author"
        case commentor = "Commentor"
        case createdOn = "CreatedOn"
        case description = "Description"
        case doneRatio = "DoneRatio"
        case dueDate = "DueDate"
        case estimatedHour = "EstimatedHours"
        case id = "ID"
        case jobId = "JobID"
        case notes = "Notes"
        case priority = "Priority"
        case startDate = "StartDate"
        case status = "Status"
        case subject = "Subject"
    }
}

//
//  Message.swift
//  RmineTwist
//
//  Created by Minkyu Lee on 8/12/24.
//

import Foundation
import FirebaseFirestore

struct Message: Identifiable, Codable {
    let id: String
    let objectKey: String
    let source, specversion, type: String
    let time: Timestamp
    let data: MessageData
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case objectKey = "object_key"
        case source, specversion, type
        case time = "time"
        case data = "data"
    }
}

struct MessageData: Identifiable, Codable {
    let authorId: String
    let id: Int
    let boardId: String
    let content: String
    let createdOn: Timestamp
    let locked: Bool
    let sticky: Bool
    let subject: String
    let updatedOn: Timestamp
    
    enum CodingKeys: String, CodingKey {
        case authorId = "AuthorID"
        case id = "ID"
        case boardId = "BoardID"
        case content = "Content"
        case createdOn = "CreatedOn"
        case locked = "Locked"
        case sticky = "Sticky"
        case subject = "Subject"
        case updatedOn = "UpdatedOn"
    }
}

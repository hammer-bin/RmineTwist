//
//  User.swift
//  RmineTwist
//
//  Created by Minkyu Lee on 8/12/24.
//

import Foundation
import FirebaseFirestore

// MARK: - User
struct User: Identifiable, Codable {
    let id: String
    let objectKey: String
    let source, specversion, type: String
    let time: Timestamp
    let data: DataClass
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case objectKey = "object_key"
        case source, specversion, type
        case time = "time"
        case data = "data"
    }
}

// MARK: - DataClass
struct DataClass: Identifiable, Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let admin: Bool
    let login: String
    let status: Int
    let createdOn: Timestamp
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case firstName = "Firstname"
        case lastName = "Lastname"
        case admin = "Admin"
        case login = "Login"
        case status = "Status"
        case createdOn = "CreatedOn"
    }
}

// MARK: - AuthSourceID
struct AuthSourceID: Codable {
    let int64: Int
    let valid: Bool

    enum CodingKeys: String, CodingKey {
        case int64 = "Int64"
        case valid = "Valid"
    }
}

// MARK: - On
struct On: Codable {
    let time: Date
    let valid: Bool

    enum CodingKeys: String, CodingKey {
        case time = "Time"
        case valid = "Valid"
    }
}

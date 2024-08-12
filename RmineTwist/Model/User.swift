//
//  User.swift
//  RmineTwist
//
//  Created by Minkyu Lee on 8/12/24.
//

import Foundation

// MARK: - User
struct User: Identifiable, Codable {
    let specversion, id, source, type: String
    let datacontenttype, time: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let id: Int
    let login, hashedPassword, firstname, lastname: String
    let admin: Bool
    let status: Int
    let lastLoginOn: On
    let language: String
    let authSourceID: AuthSourceID
    let createdOn, updatedOn: Date
    let type, mailNotification, salt: String
    let mustChangePasswd: Bool
    let passwdChangedOn: On

    enum CodingKeys: String, CodingKey {
        case id, login
        case hashedPassword = "hashed_password"
        case firstname, lastname, admin, status
        case lastLoginOn = "last_login_on"
        case language
        case authSourceID = "auth_source_id"
        case createdOn = "created_on"
        case updatedOn = "updated_on"
        case type
        case mailNotification = "mail_notification"
        case salt
        case mustChangePasswd = "must_change_passwd"
        case passwdChangedOn = "passwd_changed_on"
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

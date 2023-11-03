//
//  User.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import Foundation

struct User {
    let uid: String
    let fullname: String
    let email: String
    let created: String

    var toDict: [String: Any] {
        return [
            "uid": uid,
            "fullname": fullname,
            "email": email,
            "created": created
        ]
    }
}

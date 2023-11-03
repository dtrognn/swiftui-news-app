//
//  UtilsHelper.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import Foundation

enum ValidateType {
    case notEmpty
    case minimumLength
}

public enum UtilsHelper {
    static func checkValidate(_ text: String?, validateType: ValidateType) -> Bool {
        guard let text = text else { return false }

        switch validateType {
        case .notEmpty:
            return !text.isEmpty
        case .minimumLength:
            return text.count >= 6
        default:
            return true
        }
    }

    static func isValidRegexPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[^A-Za-z\\d]).{6,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }

    private static func isValidEmail(_ emailStr: String) -> Bool {
        let emailTrim = emailStr.trim()
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailTrim)
    }
}

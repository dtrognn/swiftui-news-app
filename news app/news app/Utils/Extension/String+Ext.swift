//
//  String+Ext.swift
//  news app
//
//  Created by dtrognn on 03/11/2023.
//

import Foundation

public extension String {
    func trim(_ characterSet: CharacterSet = .whitespacesAndNewlines) -> String {
        return self.trimmingCharacters(in: characterSet)
    }
}

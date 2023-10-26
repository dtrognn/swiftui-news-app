//
//  Error.swift
//  news app
//
//  Created by dtrognn on 26/10/2023.
//

import Foundation

enum NetworkManagerError: Error {
    case emptyData
    case responseEmpty
    case redirection
    case client
    case server
    case parserError(Error)
    case unknown
}

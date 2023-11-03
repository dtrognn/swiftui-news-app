//
//  Catergory.swift
//  news app
//
//  Created by dtrognn on 26/10/2023.
//

import Foundation

enum Catergory: String, CaseIterable, Identifiable {
    case general
    case business
    case entertainment
    case health
    case science
    case sports
    case technology

    var id: String { rawValue }
}

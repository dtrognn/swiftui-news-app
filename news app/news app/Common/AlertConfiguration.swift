//
//  AlertConfiguration.swift
//  news app
//
//  Created by dtrognn on 02/11/2023.
//

import SwiftUI

public struct AlertConfiguration {
    public var isPresented: Binding<Bool>
    public var title: String
    public var message: String?
    public var primaryButtonText: String
    public var secondaryButtonText: String?
    public var primaryAction: (() -> Void)?
    public var secondaryAction: (() -> Void)?

    public init(isPresented: Binding<Bool>,
        title: String,
        message: String? = nil,
        primaryButtonText: String,
        secondaryButtonText: String? = nil,
        primaryAction: (() -> Void)? = nil,
        secondaryAction: (() -> Void)? = nil) {
        self.isPresented = isPresented
        self.title = title
        self.message = message
        self.primaryButtonText = primaryButtonText
        self.secondaryButtonText = secondaryButtonText
        self.primaryAction = primaryAction
        self.secondaryAction = secondaryAction
    }
}

//
//  Alert+Ext.swift
//  news app
//
//  Created by dtrognn on 02/11/2023.
//

import SwiftUI

public extension Alert {
    static func alert(_ alertConfiguration: AlertConfiguration) -> Alert {
        if let secondaryButtonText = alertConfiguration.secondaryButtonText {
            return Alert(title: Text(alertConfiguration.title),
                         message: alertConfiguration.message != nil ? Text(alertConfiguration.message!) : nil,
                         primaryButton: .default(Text(alertConfiguration.primaryButtonText), action: alertConfiguration.primaryAction),
                         secondaryButton: .default(Text(secondaryButtonText), action: alertConfiguration.secondaryAction))
        }

        return Alert(title: Text(alertConfiguration.title),
                     message: alertConfiguration.message != nil ? Text(alertConfiguration.message!) : nil,
                     dismissButton: .cancel(Text(alertConfiguration.primaryButtonText), action: alertConfiguration.primaryAction))
    }
}

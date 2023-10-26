//
//  View+Ext.swift
//  news app
//
//  Created by dtrognn on 26/10/2023.
//

import SwiftUI

public extension View {
    func presentSharedSheet(_ url: String) {
        let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
            .keyWindow?
            .rootViewController?
            .present(activityVC, animated: true)
    }
}

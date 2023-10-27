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
    
    var asAnyView: AnyView {
        return AnyView(self)
    }
    
    func hiddenTabBar(_ isHidden: Bool) -> some View {
        if isHidden {
            return modifier(HiddenTabBar()).asAnyView
        } else {
            return modifier(ShowTabBar()).asAnyView
        }
    }
}

struct HiddenTabBar: ViewModifier {
    func body(content: Content) -> some View {
        return content.padding(.zero)
            .onAppear {
            Tool.hiddenTabBar()
        }
    }
}

struct ShowTabBar: ViewModifier {
    func body(content: Content) -> some View {
        return content.padding(.zero).onAppear {
            Tool.showTabBar()
        }
    }
}

struct Tool {
    static func showTabBar() {
        UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.allSubviews().forEach({ (v) in
            if let view = v as? UITabBar {
                view.isHidden = false
            }
        })
    }

    static func hiddenTabBar() {
        UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.allSubviews().forEach({ (v) in
            if let view = v as? UITabBar {
                view.isHidden = true
            }
        })
    }
}

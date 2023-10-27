//
//  UIView+Ext.swift
//  news app
//
//  Created by dtrognn on 27/10/2023.
//

import UIKit

public extension UIView {
    func allSubviews() -> [UIView] {
        var res = self.subviews
        for subview in self.subviews {
            let riz = subview.allSubviews()
            res.append(contentsOf: riz)
        }
        return res
    }
}

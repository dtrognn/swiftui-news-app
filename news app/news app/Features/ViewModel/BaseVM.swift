//
//  BaseVM.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import Combine
import Foundation

open class BaseVM: ObservableObject {
    var cancellableSet: Set<AnyCancellable> = []

    init() {
        loadData()
        makeSubscription()
        subcribe()
    }

    open func loadData() {}

    open func makeSubscription() {}

    open func subcribe() {}
}

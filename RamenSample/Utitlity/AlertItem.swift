//
//  AlertItem.swift
//  RamenSample
//
//  Created by kitano hajime on 2022/03/14.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dissmissButton: Alert.Button
}

struct AlertContext {
    // MARK: - MapView Errors
    static let unableToGetRamenInfo = AlertItem(title: Text("Fetch Error"),
                                                message: Text("Unable to retrieve shop info at this time"),
                                                dissmissButton: .default(Text("OK")))
}

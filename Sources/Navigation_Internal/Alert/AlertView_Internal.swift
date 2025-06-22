//
//  AlertView_Internal.swift
//  Navigation
//
//  Created by Alexander Löwe on 22.06.25.
//

import SwiftUI
import Navigation_Protocols

public struct AlertView<Content: View>: View {
    let content: Content
    @Binding var alertPush: AlertPush?
    
    public init(content: Content, alertPush: Binding<AlertPush?>) {
        self.content = content
        self._alertPush = alertPush
    }
    
    public var body: some View {
        content
            .alert(alertPush?.title ?? "",
                   isPresented: $alertPush.isPresented,
                   presenting: alertPush) { alert in
                if let buttonContent = alertPush?.buttonContent {
                    buttonContent
                }
            } message: { alert in
                Text(alert.message)
            }
    }
}

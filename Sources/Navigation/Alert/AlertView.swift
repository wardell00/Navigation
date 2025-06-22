//
//  SwiftUIView.swift
//  Navigation
//
//  Created by Alexander Löwe on 22.06.25.
//

import SwiftUI

struct AlertView<Content: View>: View {
    let content: Content
    @Binding var alertPush: AlertPush?
    var body: some View {
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


public extension View {
    
    func alert(_ alertPush: Binding<AlertPush?>) -> some View {
        AlertView(content: self, alertPush: alertPush)
    }
}

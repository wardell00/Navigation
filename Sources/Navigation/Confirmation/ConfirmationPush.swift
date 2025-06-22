//
//  SwiftUIView.swift
//  Navigation
//
//  Created by Alexander Löwe on 22.06.25.
//

import SwiftUI

public struct ConfirmationPush: Identifiable, @unchecked Sendable {
    public let id: UUID = UUID()
    let title: LocalizedStringKey
    let message: LocalizedStringKey
    let titleVisibility: Visibility
    let buttonContent: AnyView
    
    init<Content: View>(
        title: LocalizedStringKey,
        message: LocalizedStringKey,
        titleVisibility: Visibility = .automatic,
        @ViewBuilder buttonContent: @escaping () -> Content
    ) {
        self.title = title
        self.message = message
        self.titleVisibility = titleVisibility
        self.buttonContent = AnyView(buttonContent())
    }
}

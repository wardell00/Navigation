//
//  SwiftUIView.swift
//  Navigation
//
//  Created by Alexander Löwe on 22.06.25.
//

import SwiftUI

public struct AlertPush: Identifiable, @unchecked Sendable{
    public let id: UUID = UUID()
    let title: LocalizedStringKey
    let message: LocalizedStringKey
    let buttonContent: AnyView?
    
    public init<Content: View>(
        title: LocalizedStringKey,
        message: LocalizedStringKey,
        @ViewBuilder buttonContent: () -> Content
    ) {
        self.title = title
        self.message = message
        self.buttonContent = AnyView(buttonContent())
    }
    
    public init(
        title: LocalizedStringKey,
        message: LocalizedStringKey
    ) {
        self.title = title
        self.message = message
        self.buttonContent = nil
    }
    
}

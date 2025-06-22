//
//  SwiftUIView.swift
//  Navigation
//
//  Created by Alexander Löwe on 22.06.25.
//

import SwiftUI
import Navigation_Internal
@_exported import Navigation_Protocols

public extension View {
    func confirmation(_ confirm: Binding<ConfirmationPush?>) -> some View {
        ConfirmationDialogView(confirmPush: confirm, content: self)
    }
}

//
//  SwiftUIView.swift
//  Navigation
//
//  Created by Alexander Löwe on 22.06.25.
//

import SwiftUI

struct ConfirmationDialogView<Content: View>: View {
    @Binding var confirmPush: ConfirmationPush?
    let content: Content
    var body: some View {
        content
            .confirmationDialog(confirmPush?.title ?? "",
                                isPresented: $confirmPush.isPresented,
                                titleVisibility: confirmPush?.titleVisibility ?? .automatic,
                                presenting: confirmPush) { confirm in
                confirm.buttonContent
            } message: { confirm in
                Text(confirm.message)
            }
    }
}

public extension View {
    func confirmation(_ confirm: Binding<ConfirmationPush?>) -> some View {
        ConfirmationDialogView(confirmPush: confirm, content: self)
    }
}

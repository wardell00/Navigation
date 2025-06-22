//
//  ConfirmationDialogView.swift
//  Navigation
//
//  Created by Alexander Löwe on 22.06.25.
//

import SwiftUI
import Navigation_Protocols

public struct ConfirmationDialogView<Content: View>: View {
    @Binding var confirmPush: ConfirmationPush?
    let content: Content
    
    public init(confirmPush: Binding<ConfirmationPush?>, content: Content) {
        self._confirmPush = confirmPush
        self.content = content
    }
    
    public var body: some View {
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

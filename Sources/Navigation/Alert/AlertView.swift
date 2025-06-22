//
//  SwiftUIView.swift
//  Navigation
//
//  Created by Alexander Löwe on 22.06.25.
//

import SwiftUI
import Navigation_Internal

public extension View {
    
    func alert(_ alertPush: Binding<AlertPush?>) -> some View {
        AlertView(content: self, alertPush: alertPush)
    }
}

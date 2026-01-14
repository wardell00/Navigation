//
//  SwiftUIView.swift
//  Navigation
//
//  Created by Alexander Löwe on 22.06.25.
//

import SwiftUI
import Navigation_Internal


public extension View {
    
    @ViewBuilder
    func navigationButtonListStyle(isShowing: Bool = true) -> some View {
        if isShowing { NavigationButtonListStyle(content: self) }
    }
}

#Preview {
    List {
        Text("Hello")
            .navigationButtonListStyle()
    }
}

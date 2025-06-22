//
//  SwiftUIView.swift
//  Navigation
//
//  Created by Alexander Löwe on 22.06.25.
//

import SwiftUI
import Navigation_Internal


public extension View {
    
    func navigationButtonListStyle() -> some View {
        NavigationButtonListStyle(content: self)
    }
}

#Preview {
    List {
        Text("Hello")
            .navigationButtonListStyle()
    }
}

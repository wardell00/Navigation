//
//  SwiftUIView.swift
//  Navigation
//
//  Created by Alexander Löwe on 22.06.25.
//

import SwiftUI

public struct NavigationButtonListStyle<Content: View>: View {
    let content: Content
    
    public init(content: Content) {
        self.content = content
    }
    
    public var body: some View {
        HStack {
            content
            Spacer()
            Image(systemName: "chevron.forward")
                .foregroundStyle(.secondary)
        }
        .foregroundStyle(.foreground)
    }
}

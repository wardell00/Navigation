//
//  SwiftUIView.swift
//  Navigation
//
//  Created by Alexander Löwe on 22.06.25.
//

import SwiftUI

struct NavigationButtonListStyle<Content: View>: View {
    let content: Content
    
    init(content: Content) {
        self.content = content
    }
    
    var body: some View {
        HStack {
            content
            Spacer()
            Image(systemName: "chevron.forward")
                .foregroundStyle(.secondary)
        }
        .foregroundStyle(.foreground)
    }
}

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

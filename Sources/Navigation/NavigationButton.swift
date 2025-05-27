//
//  File.swift
//  Navigation
//
//  Created by Alexander Löwe on 27.05.25.
//

import Foundation
import SwiftUI

public struct NavigationButton<Content: View>: View {
    let destination: Destination
    @ViewBuilder var content: () -> Content
    @Environment(Router.self) private var router
    
    public init(
        destination: Destination,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.destination = destination
        self.content = content
    }
    
    public init(
        push destination: PushNavigationWrapper,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.destination = .push(destination)
        self.content = content
    }
    
    public init(
        sheet destination: SheetNavigationWrapper,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.destination = .sheet(destination)
        self.content = content
    }
    
    public init(
        fullScreen destination: FullScreenNavigationWrapper,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.destination = .fullScreen(destination)
        self.content = content
    }
    
    public var body: some View {
        Button {
            router.navigate(to: destination)
        } label: {
            content()
        }

    }
}

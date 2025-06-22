//
//  NavigationContainer.swift
//  Navigation
//
//  Created by Alexander Löwe on 22.06.25.
//

import SwiftUI
import Navigation_Internal

public struct NavigationContainer<Push: PushNavigation, Sheet: ModalNavigation, FullScreen: ModalNavigation, Content: View>: View {
    @Bindable var router: NavigationRouter<Push, Sheet, FullScreen>
    @ViewBuilder var content: () -> Content
    
    public init(router: NavigationRouter<Push, Sheet, FullScreen>,
                @ViewBuilder content: @escaping () -> Content) {
        self._router = .init(wrappedValue: router)
        self.content = content
    }
    
    public var body: some View {
        _NavigationContainer(router: $router, content: content)
    }
}





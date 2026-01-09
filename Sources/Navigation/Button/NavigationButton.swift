//
//  NavigationButton.swift
//  Navigation
//
//  Created by Alexander Löwe on 22.06.25.
//

import SwiftUI
import Navigation_Internal

public struct _NavigationButton<Push: PushNavigation, Sheet: ModalNavigation, FullScreen: ModalNavigation, TabNav: TabNavigation, Content: View>: View {
    @Bindable var router: NavigationRouter<Push, Sheet, FullScreen, TabNav>
    let destination: Destination<Push, Sheet, FullScreen>
    @ViewBuilder let label: () -> Content
    
    public init(
        router: NavigationRouter<Push, Sheet, FullScreen, TabNav>,
        destination: Destination<Push, Sheet, FullScreen>,
        label: @escaping () -> Content) {
            self.router = router
            self.destination = destination
            self.label = label
        }
    
    public var body: some View {
        _NavigationButtonImpl(router: $router, destination: destination, label: label)
    }
}



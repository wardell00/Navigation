//
//  NavigationButton.swift
//  Navigation
//
//  Created by Alexander Löwe on 22.06.25.
//

import SwiftUI
import Navigation_Internal

public struct _NavigationButton<Push: PushNavigation, Sheet: ModalNavigation, FullScreen: ModalNavigation, Content: View>: View {
    @Bindable var router: NavigationRouter<Push, Sheet, FullScreen>
    let destination: Destination<Push, Sheet, FullScreen>
    @ViewBuilder let label: () -> Content
    
    public init(
        router: NavigationRouter<Push, Sheet, FullScreen>,
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



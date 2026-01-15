//
//  NavigationButton.swift
//  Navigation
//
//  Created by Alexander Löwe on 22.06.25.
//

import SwiftUI
import Navigation_Internal

public struct _NavigationButton<Router: Navigating, Content: View>: View {
    let  router: Router
    let destination: Destination<Router.Push, Router.Sheet, Router.FullScreen>
    @ViewBuilder let label: () -> Content
    
    public init(
        router: Router,
        destination: Destination<Router.Push, Router.Sheet, Router.FullScreen>,
        label: @escaping () -> Content) {
            self.router = router
            self.destination = destination
            self.label = label
        }
    
    public var body: some View {
        _NavigationButtonImpl(router: router, destination: destination, label: label)
    }
}



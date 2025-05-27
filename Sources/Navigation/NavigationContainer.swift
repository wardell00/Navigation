//
//  File.swift
//  Navigation
//
//  Created by Alexander Löwe on 27.05.25.
//

import Foundation
import SwiftUI


public struct NavigationContainer<Content: View>: View {
    @Bindable var router: Router
    @ViewBuilder var content: () -> Content
    
    public init(parentRouter: Router,
         tab: TabNavigationWrapper,
         @ViewBuilder content: @escaping () -> Content) {
        self._router = .init(wrappedValue: parentRouter.childRouter(tab: tab))
        self.content = content
    }
    
   public  var body: some View {
       ChildContainer(router: router) {
           content()
       }
       .environment(router)
       .onAppear(perform: router.setActive)
       .onDisappear(perform: router.resignActive)
    }
}
private struct ChildContainer<Content: View>: View {
    @Bindable var router: Router
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            content()
                .navigationDestination(for: PushNavigationWrapper.self) { destination in
                    destination.destinationView()
                }
        }
        .sheet(item: $router.presentedSheet) { sheet in
            sheet.destinationView()
        }
        #if os(iOS) || os(tvOS) || targetEnvironment(macCatalyst)
        .fullScreenCover(item: $router.presentedFullScreen) { fullScreen in
            fullScreen.destinationView()
        }
        #else
        .sheet(item: $router.presentedFullScreen) { sheet in
            sheet.destinationView()
        }
        #endif
    }
}

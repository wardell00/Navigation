//
//  NavigationContainer.swift
//  Navigation
//
//  Created by Alexander Löwe on 22.06.25.
//

import SwiftUI

public struct NavigationContainer<Push: PushNavigation, Sheet: ModalNavigation, FullScreen: ModalNavigation, Content: View>: View {
    @Bindable var router: NavigationRouter<Push, Sheet, FullScreen>
    @ViewBuilder var content: () -> Content
    
    public init(router: NavigationRouter<Push, Sheet, FullScreen>,
                @ViewBuilder content: @escaping () -> Content) {
        self._router = .init(wrappedValue: router)
        self.content = content
    }
    
    public var body: some View {
        _NavigationContainer(router: router, content: content)
    }
}


private struct _NavigationContainer<Push: PushNavigation, Sheet: ModalNavigation, FullScreen: ModalNavigation, Content: View>: View {
    @Bindable var router: NavigationRouter<Push, Sheet, FullScreen>
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        ChildContainer(router: router) {
            content()
        }
        .environment(router)
        .onAppear(perform: router.setActive)
        .onDisappear(perform: router.resignActive)
    }
}

private struct ChildContainer<Push: PushNavigation, Sheet: ModalNavigation, FullScreen: ModalNavigation, Content: View>: View {
    @Bindable var router: NavigationRouter<Push, Sheet, FullScreen>
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            content()
                .navigationDestination(for: Push.self) { push in
                    push.destinationView()
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


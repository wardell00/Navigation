//
//  NavigationButton.swift
//  Navigation
//
//  Created by Alexander Löwe on 22.06.25.
//

import SwiftUI
import Navigation_Internal

public struct NavigationButton<
    Push: PushNavigation,
    Sheet: ModalNavigation,
    FullScreen: ModalNavigation,
    TabNav: TabNavigation,
    Content: View>: View {
    
    @Environment(NavigationRouter<Push, Sheet, FullScreen, TabNav>.self) private var router
    let destination: Destination<Push, Sheet, FullScreen>
    let isInList: Bool
    @ViewBuilder let label: () -> Content
    
    public init(
        destination: Destination<Push, Sheet, FullScreen>,
        isInList: Bool = false,
        label: @escaping () -> Content) {
            self.destination = destination
            self.isInList = isInList
            self.label = label
        }
    
    public var body: some View {
        @Bindable var bindingRouter = router
        _NavigationButtonImpl(router: $bindingRouter, destination: destination, label: label)
            .navigationButtonListStyle(isShowing: isInList)
    }
}

public extension NavigationButton where Content == Text {
    init(
        _ titleResource: LocalizedStringResource,
        isInList: Bool = false,
        destination: Destination<Push, Sheet, FullScreen>,
    ) {
        self.init(destination: destination, isInList: isInList) {
            Text(titleResource)
        }
    }
    
    init(
        _ titleKey: LocalizedStringKey,
        isInList: Bool = false,
        destination: Destination<Push, Sheet, FullScreen>,
    ) {
        self.init(destination: destination, isInList: isInList) {
            Text(titleKey)
        }
    }
    
    init<S: StringProtocol>(
        _ title: S,
        isInList: Bool = false,
        destination: Destination<Push, Sheet, FullScreen>,
    ) {
        self.init(destination: destination, isInList: isInList) {
            Text(title)
        }
    }
}


public extension NavigationButton where Content == Label<Text, Image> {
    
    init(
        _ titleResource: LocalizedStringResource,
        sfSymbol: String,
        isInList: Bool = false,
        destination: Destination<Push, Sheet, FullScreen>
    ) {
        self.init(destination: destination, isInList: isInList) {
            Label(titleResource, systemImage: sfSymbol)
        }
    }
    
    init(
        _ titleKey: LocalizedStringKey,
        sfSymbol: String,
        isInList: Bool = false,
        destination: Destination<Push, Sheet, FullScreen>
    ) {
        self.init(destination: destination, isInList: isInList) {
            Label(titleKey, systemImage: sfSymbol)
        }
    }
    
    init<S: StringProtocol>(
        _ title: S,
        sfSymbol: String,
        isInList: Bool = false,
        destination: Destination<Push, Sheet, FullScreen>,
    ) {
        self.init(destination: destination, isInList: isInList) {
            Label(title, systemImage: sfSymbol)
        }
    }
}

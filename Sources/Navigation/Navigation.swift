//
//  Navigation.swift
//  Navigation
//
//  Created by Alexander Löwe on 22.06.25.
//

import SwiftUI

public protocol ViewProvider: Identifiable {
    associatedtype Content: View
    
    @ViewBuilder
    func destinationView() -> Content
}

public protocol PushNavigation: ViewProvider, Hashable {}

public protocol ModalNavigation: ViewProvider {}


public enum Destination<Push: PushNavigation, Sheet: ModalNavigation, FullScreen: ModalNavigation> {
    case push(_ destination: Push)
    case sheet(_ destination: Sheet)
    case fullScreen(_ destination: FullScreen)
}

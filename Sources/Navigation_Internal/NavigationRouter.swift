//
//  NavigationRouter.swift
//  Navigation
//
//  Created by Alexander Löwe on 22.06.25.
//

import SwiftUI

@Observable
public final class NavigationRouter<PushNav: PushNavigation, SheetNav: ModalNavigation, FullScreenNav: ModalNavigation> {
    
    let id: UUID = UUID()
    
    public var navigationPath = [PushNav]()
    
    public var presentedSheet: SheetNav?
    
    public var presentedFullScreen: FullScreenNav?
    
    private(set) var isActive: Bool = false
    
    private func reset() {
        navigationPath.removeAll()
        presentedSheet = nil
        presentedFullScreen = nil
    }
    
    public init() {}
    
}

public extension NavigationRouter {
    
    private func _setActive() {
        isActive = true
    }
    
    func setActive() {
        _setActive()
    }
    
    private func _resignActive() {
        isActive = false
    }
    
    func resignActive() {
        _resignActive()
    }
}

public extension NavigationRouter {
    
    private func _navigate(to destination: Destination<PushNav, SheetNav, FullScreenNav>) {
        
        switch destination {
        case .push(let destination):
            _push(destination)
        case .sheet(let destination):
            _present(destination)
        case .fullScreen(let destination):
            _present(destination)
        }
    }
    
    func navigate(to destination: Destination<PushNav, SheetNav, FullScreenNav>) {
        _navigate(to: destination)
    }
    
    private func _push(_ destination: PushNav) {
        navigationPath.append(destination)
    }
    
    func push(_ destination: PushNav) {
        _push(destination)
    }
    
    private func _present(_ destination: SheetNav) {
        presentedSheet = destination
    }
    
    func present(_ destination: SheetNav) {
        _present(destination)
    }
    
    private func _present(_ destination: FullScreenNav) {
        presentedFullScreen = destination
    }
    
    func present(_ destination: FullScreenNav) {
        _present(destination)
    }
    
    func deepLinkOpen(to destination: Destination<PushNav, SheetNav, FullScreenNav>) {
        guard isActive else { return }
        navigate(to: destination)
    }
}

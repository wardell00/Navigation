//
//  File.swift
//  Navigation
//
//  Created by Alexander Löwe on 27.05.25.
//

import Foundation
import SwiftUI
import OSLog

@Observable
public final class Router {
    
    let id: UUID = UUID()
    let level: Int
    
    public let identiferTab: TabNavigationWrapper?
    
    public var selectedTab: TabNavigationWrapper?
    
    public var navigationPath = [PushNavigationWrapper]()
    
    public var presentedSheet: SheetNavigationWrapper?
    
    public var presentedFullScreen: FullScreenNavigationWrapper?
    
    weak var parent: Router?
    
    private(set) var isActive: Bool = false
    
    public init(level: Int = 0,
                identiferTab: TabNavigationWrapper? = nil
    ) {
        self.level = level
        self.identiferTab = identiferTab
        self.parent = nil
    }
    
    
    private func reset() {
        navigationPath.removeAll()
        presentedSheet = nil
        presentedFullScreen = nil
    }
}

public extension Router {
    
    func childRouter(tab: TabNavigationWrapper? = nil) -> Router {
        let router = Router(level: level + 1,
                            identiferTab: tab ?? identiferTab)
        router.parent = self
        return router
    }
    
    func setActive() {
        parent?.resignActive()
        isActive = true
    }
    func resignActive() {
        isActive = false
    }
}


public extension Router {
    
    func navigate(to destination: Destination) {
        
        switch destination {
        case .tab(let tab):
            selectTab(for: tab)
        case .push(let destination):
            push(destination)
        case .sheet(let destination):
            present(destination)
        case .fullScreen(let destination):
            present(destination)
        }
    }
    
    func selectTab(for destination: TabNavigationWrapper) {
        if level == 0 {
            selectedTab = destination
        }
        else {
            parent?.selectTab(for: destination)
            reset()
        }
    }
    
    func push(_ destination: PushNavigationWrapper) {
        navigationPath.append(destination)
    }
    
    func present(_ destination: SheetNavigationWrapper) {
        presentedSheet = destination
    }
    
    func present(_ destination: FullScreenNavigationWrapper) {
        presentedFullScreen = destination
    }
}

// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public protocol DestinationPr: Identifiable, Hashable, CustomStringConvertible {
    associatedtype Content: View
    
    func destinationView() -> Content
}

public protocol TabNavigationPr: DestinationPr {
    
}
public protocol PushNavigationPr: DestinationPr {
    
}

public protocol SheetNavigationPr: DestinationPr {
    
}

public protocol FullScreenNavigationPr: DestinationPr {
    
}

public enum Destination {
    case tab(_ destination: TabNavigationWrapper)
    case push(_ destination: PushNavigationWrapper)
    case sheet(_ destination: SheetNavigationWrapper)
    case fullScreen(_ destination: FullScreenNavigationWrapper)
}

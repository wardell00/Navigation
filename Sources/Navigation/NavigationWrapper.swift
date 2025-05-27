//
//  File.swift
//  Navigation
//
//  Created by Alexander Löwe on 27.05.25.
//

import Foundation
import SwiftUI

public struct TabNavigationWrapper:  Identifiable, CustomStringConvertible {
    private let baseHash: AnyHashable
    private let _view: () -> AnyView
    private let _description: () -> String
    private let _id: () -> AnyHashable
    
    public init<T: TabNavigationPr>(_ base: T) {
        self.baseHash = AnyHashable(base)
        self._id = { AnyHashable(base.id) }
        self._description = { base.description }
        self._view = { AnyView(base.destinationView()) }
    }
    
    public var id: AnyHashable { _id() }
    public func destinationView() -> AnyView { _view() }
    public var description: String { _description() }
}

extension TabNavigationWrapper: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(baseHash)
    }
    
    public static func == (lhs: TabNavigationWrapper, rhs: TabNavigationWrapper) -> Bool {
        lhs.baseHash == rhs.baseHash
    }
}
public struct PushNavigationWrapper:  Identifiable, CustomStringConvertible {
    private let baseHash: AnyHashable
    private let _view: () -> AnyView
    private let _description: () -> String
    private let _id: () -> AnyHashable
    
    public init<T: PushNavigationPr>(_ base: T) {
        self.baseHash = AnyHashable(base)
        self._id = { AnyHashable(base.id) }
        self._description = { base.description }
        self._view = { AnyView(base.destinationView()) }
    }
    
    public var id: AnyHashable { _id() }
    public func destinationView() -> AnyView { _view() }
    public var description: String { _description() }
}

extension PushNavigationWrapper: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(baseHash)
    }
    
    public static func == (lhs: PushNavigationWrapper, rhs: PushNavigationWrapper) -> Bool {
        lhs.baseHash == rhs.baseHash
    }
}

public struct SheetNavigationWrapper: Identifiable, CustomStringConvertible {
    private let baseHash: AnyHashable
    private let _view: () -> AnyView
    private let _description: () -> String
    private let _id: () -> AnyHashable
    
    public init<T: SheetNavigationPr>(_ base: T) {
        self.baseHash = AnyHashable(base)
        self._id = { AnyHashable(base.id) }
        self._description = { base.description }
        self._view = { AnyView(base.destinationView()) }
    }
    
    public var id: AnyHashable { _id() }
    public func destinationView() -> AnyView { _view() }
    public var description: String { _description() }
}

extension SheetNavigationWrapper: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(baseHash)
    }
    
    public static func == (lhs: SheetNavigationWrapper, rhs: SheetNavigationWrapper) -> Bool {
        lhs.baseHash == rhs.baseHash
    }
}

public struct FullScreenNavigationWrapper: Identifiable, CustomStringConvertible {
    private let baseHash: AnyHashable
    private let _view: () -> AnyView
    private let _description: () -> String
    private let _id: () -> AnyHashable
    
    public init<T: FullScreenNavigationPr>(_ base: T) {
        self.baseHash = AnyHashable(base)
        self._id = { AnyHashable(base.id) }
        self._description = { base.description }
        self._view = { AnyView(base.destinationView()) }
    }
    
    public var id: AnyHashable { _id() }
    public func destinationView() -> AnyView { _view() }
    public var description: String { _description() }
}

extension FullScreenNavigationWrapper: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(baseHash)
    }
    
    public static func == (lhs: FullScreenNavigationWrapper, rhs: FullScreenNavigationWrapper) -> Bool {
        lhs.baseHash == rhs.baseHash
    }
}

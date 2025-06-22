//
//  SwiftUIView.swift
//  Navigation
//
//  Created by Alexander Löwe on 22.06.25.
//

import SwiftUI
import Navigation_Protocols

public extension Binding where Value == AlertPush? {
    var isPresented: Binding<Bool> {
        Binding<Bool>(
            get: { self.wrappedValue != nil },
            set: { newValue in
                if !newValue {
                    self.wrappedValue = nil
                }
            }
        )
    }
}

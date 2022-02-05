//
//  View+Ext.swift
//  eWallet
//
//  Created by Duncan Kent on 05/02/2022.
//

import Foundation
import SwiftUI

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(
            LinearGradient(
                colors: colors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
        )
            .mask(self)
    }
}


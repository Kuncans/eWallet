//
//  NumberEntryLimitSizeField.swift
//  eWallet
//
//  Created by Duncan Kent on 06/02/2022.
//

import SwiftUI
import Combine

struct NumberEntryLimitSizeField: View {
    
    @Binding var boundNumber: String
    var textPlaceholder: String
    var numberLimit: Int
    
    
    var body: some View {
        
        return TextField(textPlaceholder, text: $boundNumber)
            .keyboardType(.numberPad)
            .onReceive(Just(boundNumber)) { newValue in
                let filtered = newValue.filter { "0123456789".contains($0) }
                if filtered != newValue {
                    self.boundNumber = filtered
                }
                if filtered.count >= 17 {
                    self.boundNumber = String(String(filtered).prefix(16))
                }
            }
    }
}

//TextField("Card Number", text: $cardNumber)
//    .keyboardType(.numberPad)
//    .onReceive(Just(cardNumber)) { newValue in
//        let filtered = newValue.filter { "0123456789".contains($0) }
//        if filtered != newValue {
//            self.cardNumber = filtered
//        }
//        if filtered.count == 17 {
//            self.cardNumber = String(String(filtered).prefix(16))
//        }
//    }

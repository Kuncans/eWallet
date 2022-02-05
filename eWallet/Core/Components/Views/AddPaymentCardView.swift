//
//  AddPaymentCardView.swift
//  eWallet
//
//  Created by Duncan Kent on 05/02/2022.
//

import SwiftUI

struct AddPaymentCardView: View {
    
    @State private var balance: Decimal = 0.0
    @State private var cardNumber: String = ""
    @State private var expiryDay: String = ""
    @State private var expiryMonth: String = ""
    @State private var newCardType: cardType = .visa
    @State private var cardHolderName: String = ""
    @State private var newCardColor: cardColor = .blue
    
    var body: some View {
        
        Form {
            
            Section("Balance") {
                
                TextField("Current Balance", value: $balance, format:
                    .currency(code: Locale.current.currencyCode ?? "GBP"))
                    .keyboardType(.decimalPad)
                    .lineLimit(1)
            }
            
            Section("Card Details") {
                TextField("Card Number", text: $cardNumber)
                
                TextField("Expiry Day", text: $expiryDay)
                
                TextField("Expiry Month", text: $expiryMonth)
                
                Picker("Card Color", selection: $newCardType) {
                    ForEach(cardType.allCases, id: \.self) { type in
                        Text(type.rawValue.capitalized)
                    }
                }.pickerStyle(.segmented)
            }
            
            Section("Card Holder") {
                TextField("Name on card", text: $cardHolderName)
            }
            
            Section("Card Personalization") {
                Picker("Card Color", selection: $newCardColor) {
                    ForEach(cardColor.allCases, id: \.self) { color in
                        Text(color.rawValue.capitalized)
                            .gradientForeground(colors: color.color)
                    }
                }
            }
            
        }
        .navigationTitle("Add A Payment Card")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddPaymentCardView_Previews: PreviewProvider {
    static var previews: some View {
        AddPaymentCardView()
    }
}

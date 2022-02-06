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
                        HStack {
                            RoundedRectangle(cornerRadius: 10)
                                .gradientForeground(colors: color.color)
                                .frame(width: 32, height: 32)
                                .padding(.trailing, 8)
                            Text(color.rawValue.capitalized)
                                .frame(maxWidth: 60, alignment: .leading)
                        }
                    }
                }
            }
            
            Button {
                print("Saved Payment Card")
            } label: {
                Text("Save Card")
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            
        }
        .navigationTitle("New Payment Card")
//        .navigationBarTitleDisplayMode(.default)
    }
}

struct AddPaymentCardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddPaymentCardView()
        }
    }
}

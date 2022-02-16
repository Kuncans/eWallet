//
//  AddPaymentCardView.swift
//  eWallet
//
//  Created by Duncan Kent on 05/02/2022.
//

import SwiftUI
import Combine

struct AddPaymentCardView: View {
    
    @Environment (\.presentationMode) var presentationMode
    @StateObject private var vm = AddPaymentCardViewModel()
    
    var body: some View {
        
        Form {
            
            Section("Starting Balance") {
                
                TextField("Current Balance", value: $vm.balance, format:
                    .currency(code: Locale.current.currencyCode ?? "GBP"))
                    .keyboardType(.decimalPad)
                    .lineLimit(1)
            }
            
            Section("Card Details") {
                TextField("Card Number", text: $vm.cardNumber)
                    .keyboardType(.numberPad)
                    .onReceive(Just(vm.cardNumber)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            vm.cardNumber = filtered
                        }
                        if filtered.count >= 17 {
                            vm.cardNumber = String(String(filtered).prefix(16))
                        }
                    }
                
                TextField("Expiry Day", text: $vm.expiryMonth)
                    .keyboardType(.numberPad)
                    .onReceive(Just(vm.expiryMonth)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            vm.expiryMonth = filtered
                        }
                        if filtered.count >= 3 {
                            vm.expiryMonth = String(String(filtered).prefix(2))
                        }
                    }
                
                TextField("Expiry Month", text: $vm.expiryYear)
                    .keyboardType(.numberPad)
                    .onReceive(Just(vm.expiryYear)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            vm.expiryYear = filtered
                        }
                        if filtered.count >= 3 {
                            vm.expiryYear = String(String(filtered).prefix(2))
                        }
                    }
                
                Picker("Card Color", selection: $vm.newCardType) {
                    ForEach(cardType.allCases, id: \.self) { type in
                        Text(type.rawValue.capitalized)
                    }
                }.pickerStyle(.segmented)
            }
            
            Section("Card Holder") {
                TextField("Name on card", text: $vm.cardHolderName)
            }
            
            Section("Card Personalization") {
                ColorPicker("Card Color", selection: $vm.newCardColor)
            }
            
            Button {
                vm.saveCard()
                presentationMode.wrappedValue.dismiss()
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

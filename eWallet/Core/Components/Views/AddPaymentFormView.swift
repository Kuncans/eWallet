//
//  AddPaymentFormView.swift
//  eWallet
//
//  Created by Duncan Kent on 05/02/2022.
//

import SwiftUI

struct AddPaymentFormView: View {
    
    @State private var useCurrentDateTime: Bool = true
    @State private var selectedCard: PaymentCard = MockCard.mockPaymentCardList[0]
    
    @State private var toFrom: String = ""
    @State private var amount: Decimal?
    @State private var dateSelected: Date = Date()
    @State private var time: Date = Date()
    @State private var outgoingPayment: Bool = true
    @State private var paymentCategory: paymentType = paymentType.entertainment
    
    var body: some View {
        
        Form {
            Section(header: Text("Payment Card")) {
                TabView (selection: $selectedCard) {
                    ForEach(MockCard.mockPaymentCardList) { card in
                        PaymentCardView(paymentCard: card).tag(card)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .frame(minHeight: 220)
                .tabViewStyle(.page)
            }
            
            Section("Payment Details") {
                TextField("Company Name", text: $toFrom)
                    .lineLimit(1)
                
                TextField("Amount", value: $amount, format:
                                .currency(code: Locale.current.currencyCode ?? "GBP"))
                    .keyboardType(.decimalPad)
                    .lineLimit(1)
            }
            
            Section("Payment Options") {
                Toggle("Outgoing Payment", isOn: $outgoingPayment)
                
                Toggle("Use Current Date/Time", isOn: $useCurrentDateTime.animation(.spring(response: 2, dampingFraction: 0.2, blendDuration: 0.7)))
                   
                if !useCurrentDateTime {
                    DatePicker("", selection: $dateSelected, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(.graphical)
                }
            }
            
            Section("Payment Type") {
                Picker(selection: $paymentCategory) {
                    ForEach(paymentType.allCases, id: \.self) { category in
                        Text(category.rawValue.capitalized)
                    }
                }
                label: {
                    Text("Category")
                }
            }
            
            Button {
                print(paymentCategory)
            } label: {
                Text("Submit Payment")
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .navigationTitle("Add A Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddPaymentFormView_Previews: PreviewProvider {
    static var previews: some View {
        AddPaymentFormView()
    }
}

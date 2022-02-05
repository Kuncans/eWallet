//
//  AddPaymentFormView.swift
//  eWallet
//
//  Created by Duncan Kent on 05/02/2022.
//

import SwiftUI

struct AddPaymentFormView: View {
    
    @State private var useCurrentTime: Bool = true
    
    @State private var toFrom: String = ""
    @State private var amount: Decimal?
    @State private var dateSelected: Date = Date()
    @State private var time: Date = Date()
    
    var body: some View {
        ScrollView {
            VStack (spacing: 16) {
                TextField("Company Name", text: $toFrom)
                    .font(.title2)
                    .padding(.leading)
                    .lineLimit(1)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                
                TextField("Amount", value: $amount, format:
                    .currency(code: Locale.current.currencyCode ?? "GBP"))
                    .font(.title2)
                    .keyboardType(.decimalPad)
                    .padding(.leading)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Toggle("Use Current Time", isOn: $useCurrentTime.animation(.spring()))
                
                if !useCurrentTime {
                    DatePicker("", selection: $dateSelected, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(.graphical)
                        .animation(.easeInOut(duration: 10), value: useCurrentTime)

                }
                
                Text(dateSelected.formatted())

                
            }
            .padding(.horizontal, 32)
        }
        .padding(.vertical, 32)
    }
}

struct AddPaymentFormView_Previews: PreviewProvider {
    static var previews: some View {
        AddPaymentFormView()
    }
}

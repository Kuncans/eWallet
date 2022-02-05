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
        ScrollView {
            VStack (spacing: 16) {
                
                Text("Select Payment Card")
                    .font(.title3)
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TabView (selection: $selectedCard) {
                    ForEach(MockCard.mockPaymentCardList) { card in
                        PaymentCardView(paymentCard: card).tag(card)
                    }
                }
                .frame(width: 320, height: 230)
                .tabViewStyle(.page)
                
                TextField("Company Name", text: $toFrom)
                    .padding(.leading)
                    .lineLimit(1)
                    .frame(height: 45)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                HStack {
                    TextField("Amount", value: $amount, format:
                        .currency(code: Locale.current.currencyCode ?? "GBP"))
                        .keyboardType(.decimalPad)
                        .padding(.leading)
                        .frame(height: 45)
                        .frame(maxWidth: .infinity)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(10)
                        .lineLimit(1)
                                         
                        Picker(selection: $paymentCategory) {
                            ForEach(paymentType.allCases, id: \.self) { category in
                                Text(category.rawValue.capitalized)
                            }
                        } label: {
                            Text(paymentCategory.rawValue.capitalized)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .frame(minWidth: 100)
                        .padding(.trailing)
                        .keyboardType(.decimalPad)
                        .padding(.leading)
                        .frame(height: 45)
                        .foregroundColor(Color(UIColor.systemGray2))
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(10)


                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Toggle("Outgoing Payment", isOn: $outgoingPayment.animation(.spring()))                      .padding(.leading)
                
                Toggle("Use Current Date/Time", isOn: $useCurrentDateTime.animation(.spring()))
                    .padding(.leading)
                if !useCurrentDateTime {
                    DatePicker("", selection: $dateSelected, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(.graphical)
                        .animation(.easeInOut(duration: 10), value: useCurrentDateTime)
                }
            }
            .padding(.horizontal, 16)
        }
        .padding(.vertical, 32)
    }
}

struct AddPaymentFormView_Previews: PreviewProvider {
    static var previews: some View {
        AddPaymentFormView()
    }
}

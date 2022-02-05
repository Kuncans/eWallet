//
//  PaymentCellView.swift
//  eWallet
//
//  Created by Duncan Kent on 04/02/2022.
//

import SwiftUI

struct PaymentCellView: View {
    
    let payment: Payment
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 60, height: 60)
                    .foregroundColor(payment.type.paymentColor.opacity(0.2))
                Image(systemName: payment.type.paymentSymbol)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32)
                    .foregroundColor(payment.type.paymentColor.opacity(0.8))
                    
            }
            .frame(width: 60, height: 60)
            
            VStack (alignment: .leading, spacing: 6){
                Text(payment.toFrom)
                    .font(.callout)
                    .lineLimit(1)

                HStack {
                    if let date = payment.dateString{
                        Text(date)
                    }
                    if let time = payment.timeString {
                        Text(time)
                    }
                    
                    Spacer()
                    
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
            }
            .frame(minWidth: 180)
            
            
            //Transaction
            HStack {
                Text(payment.outgoing ? "-" : "+")
                Text(payment.amount, format: .currency(code: Locale.current.currencyCode ?? "GBP"))
                
            }
            .foregroundColor(payment.outgoing ? .red : .green)
            .frame(maxHeight: 60, alignment: .center)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .lineLimit(1)

            
        }
        .frame(maxHeight: 60, alignment: .center)
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

struct PaymentCellView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PaymentCellView(payment: MockPayment.mockPayment)
            PaymentCellView(payment: MockPayment.mockPayment)
                .preferredColorScheme(.dark)
        }
        
        .previewLayout(.sizeThatFits)
    }
}

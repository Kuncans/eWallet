//
//  PaymentCellView.swift
//  eWallet
//
//  Created by Duncan Kent on 04/02/2022.
//

import SwiftUI

struct PaymentCellView: View {
    
    let payment: Payment = MockPayment.mockPayment
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 60, height: 60)
                    .foregroundColor(.purple.opacity(0.2))
                Image(systemName: "gamecontroller.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32)
                    .foregroundColor(.purple.opacity(0.8))
                    
            }
            .frame(width: 60, height: 60)
            
            VStack (alignment: .leading, spacing: 6){
                Text((payment.outgoing ? "To " : "From ") + payment.toFrom)
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
            
            
            //Transaction
            HStack {
                Text(payment.outgoing ? "-" : "+")
                Text("£\(payment.amount, specifier: "%.2f")")
            }
            .foregroundColor(payment.outgoing ? .red : .green)
            .frame(maxHeight: 60, alignment: .center)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .lineLimit(1)

            
        }
        .frame(maxHeight: 60, alignment: .center)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}

struct PaymentCellView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentCellView()
.previewInterfaceOrientation(.portrait)
    }
}

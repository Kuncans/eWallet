//
//  PaymentCardView.swift
//  eWallet
//
//  Created by Duncan Kent on 03/02/2022.
//

import SwiftUI

struct PaymentCardView: View {
    
    let paymentCard: PaymentCard
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    HStack(alignment: .top) {
                        VStack (alignment: .leading, spacing: 0) {
                            Text("Balance")
                                .font(.title3)
                                .foregroundColor(.white)
                            HStack (spacing: 6) {
                                Text("£\(paymentCard.balance, specifier: "%.2f")")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.white)
                                    .lineLimit(1)
                            }
                            .frame(maxWidth: 220, alignment: .leading)
                            
                            Text(paymentCard.cardHolder.uppercased())
                                .font(.subheadline)
                                .frame(maxHeight: .infinity, alignment: .bottom)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 4)
                                .lineLimit(1)
                                .foregroundColor(.white)
                                
                        }
                        Spacer()
                        
                        Text(paymentCard.cardType.uppercased())
                            .font(.title.weight(.bold).italic())
                            .padding()
                            .foregroundColor(.white)
                            .frame(maxHeight: .infinity, alignment: .top)
                        
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .top)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Card Number")
                            .font(.caption)
                        
                            .frame(maxWidth: 220, alignment: .leading)
                        Text("Expiry")
                            .font(.caption)
                        Spacer()
                    }
                    HStack {
                        Text(paymentCard.cardNumber)
                            .bold()
                            .frame(maxWidth: 220, alignment: .leading)
                        Text("\(paymentCard.expiry.month ?? 0)/\(paymentCard.expiry.day ?? 0)")
                            .bold()
                        Spacer()
                    }
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
            }
            .padding(20)
            .frame(height: 220, alignment: .top)
            .frame(maxWidth: 350)
            .background(Circle()
                            .stroke(lineWidth: 40)
                            .frame(width: 240)
                            .offset(x: -100, y: 190)
                            .foregroundColor(.secondary.opacity(0.3))
            )
            .background(Circle()
                            .stroke(lineWidth: 40)
                            .frame(width: 200)
                            .offset(x: 150, y: -150)
                            .foregroundColor(.secondary.opacity(0.3))
            )
            
            .clipped()
            .background(Color.purple.opacity(0.9), in: RoundedRectangle(
                cornerRadius: 30,
                style: .continuous))
        }
        .cornerRadius(30)
        .shadow(color: .primary, radius: 3, x: 2, y: 2)
    }
    
    
}

struct PaymentCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PaymentCardView(paymentCard: MockCard.mockPaymentCard)
            PaymentCardView(paymentCard: MockCard.mockPaymentCard)
                .preferredColorScheme(.dark)
        }
    }
}

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
                                .bold()
                                .frame(maxHeight: .infinity, alignment: .bottom)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 4)
                                .lineLimit(1)
                                .foregroundColor(.white)
                                
                                
                        }
                        Spacer()
                        
                        switch paymentCard.cardType {
                        case .visa:
                            Image("VisaType")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, alignment: .leading)
                                .padding(.trailing, 0)
                                .clipShape(Capsule().scale(0.8))
                        case .amex:
                            Image("AmexType")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, alignment: .leading)
                                .padding(.trailing, 0)
                                .clipShape(Capsule().scale(0.8))
                        case .mastercard:
                            Image("MastercardType")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, alignment: .leading)
                                .padding(.trailing, 0)
                                .clipShape(Capsule().scale(0.8))
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .top)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Card Number")
                            .font(.caption)
                            .frame(maxWidth: 220, alignment: .leading)
                        Spacer()
                        Text("Expires")
                            .font(.caption)
                            .frame(maxWidth: 50, alignment: .leading)

                        
                    }
                    HStack {
                        Text(paymentCard.hiddenCard)
                            .bold()
                            .frame(maxWidth: 220, alignment: .leading)
                        Spacer()
                        Text("\(paymentCard.expiry.month ?? 0)/\(paymentCard.expiry.day ?? 0)")
                            .bold()
                            .frame(maxWidth: 50, alignment: .leading)
                        
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
            .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomLeading))
            .clipped()
            .background(RoundedRectangle(cornerRadius: 20, style: .continuous))

        }
        .cornerRadius(20)
        .shadow(color: .primary.opacity(0.7), radius: 3, x: 0, y: 0)
        
    }
}

struct PaymentCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PaymentCardView(paymentCard: MockCard.mockPaymentCard)
                .previewLayout(.sizeThatFits)
            PaymentCardView(paymentCard: MockCard.mockPaymentCard)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}

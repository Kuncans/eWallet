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
                        cardDetailsTop
                        Spacer()
                        cardTypeImage
                    }
                }
                .frame(maxWidth: .infinity, alignment: .top)
    
                Spacer()
                cardDetailsBottom
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(20)
            .frame(minHeight: 205)
            .frame(maxWidth: 350)
            .background(Circle()
                            .stroke(lineWidth: 35)
                            .frame(width: 240)
                            .offset(x: -90, y: 150)
                            .foregroundColor(.secondary.opacity(0.3))
            )
            .background(Circle()
                            .stroke(lineWidth: 35)
                            .frame(width: 200)
                            .offset(x: 150, y: -140)
                            .foregroundColor(.secondary.opacity(0.3))
            )
            .background(LinearGradient(colors: [.purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
        }
        .cornerRadius(20)
        .shadow(color: .primary.opacity(0.7), radius: 3, x: 1, y: 1)
        .padding(8)
    }
}

struct PaymentCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PaymentCardView(paymentCard: MockCard.mockPaymentCardList[0])
                .previewLayout(.sizeThatFits)
                .padding()
            PaymentCardView(paymentCard: MockCard.mockPaymentCardList[1])
                .previewLayout(.sizeThatFits)
                .padding()
            PaymentCardView(paymentCard: MockCard.mockPaymentCardList[2])
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}

extension PaymentCardView {
    
    private var cardDetailsTop: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text("Balance")
                .font(.title3)
                .foregroundStyle(.white)
            HStack (spacing: 6) {
                Text("£\(paymentCard.balance, specifier: "%.2f")")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
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
                .foregroundStyle(.white)
        }
    }
    
    private var cardTypeImage: some View {
        switch paymentCard.cardType {
        case .visa:
            return Image("VisaType")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, alignment: .leading)
                .padding(.trailing, 0)
                .clipShape(Capsule().scale(0.8))

        case .amex:
            return Image("AmexType")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, alignment: .leading)
                .padding(.trailing, 0)
                .clipShape(Capsule().scale(0.8))

        case .mastercard:
            return Image("MastercardType")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, alignment: .leading)
                .padding(.trailing, 0)
                .clipShape(Capsule().scale(0.8))
        }
        
    }
    
    private var cardDetailsBottom: some View {
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
                Text("\(paymentCard.expiry.month ?? 0) / \(paymentCard.expiry.day ?? 0)")
                    .bold()
                    .frame(maxWidth: 50, alignment: .leading)
                
            }
        }
    }
    
}

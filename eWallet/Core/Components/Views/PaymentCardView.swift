//
//  PaymentCardView.swift
//  eWallet
//
//  Created by Duncan Kent on 03/02/2022.
//

import SwiftUI

struct PaymentCardView: View {
    
    
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    HStack {
                        VStack (alignment: .leading, spacing: 0) {
                            Text("Balance")
                                .font(.title3)
                                .foregroundColor(.white)
                            HStack (spacing: 6) {
                                Text("£1500.00")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.white)
                                    .lineLimit(1)
                                
                                    
                            }
                            .frame(maxWidth: 220, alignment: .leading)
                        }
                        Spacer()
                        
                        Text("VISA")
                            .font(.title.weight(.bold).italic())
                            .padding()
                            .foregroundColor(.white)
                        
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .top)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Card Number")
                            .font(.subheadline)
                        
                            .frame(maxWidth: 220, alignment: .leading)
                        Text("Expiry")
                            .font(.subheadline)
                        Spacer()
                    }
                    HStack {
                        Text("0398 **** **** 9034")
                            .bold()
                            .frame(maxWidth: 220, alignment: .leading)
                        Text("09/24")
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
            PaymentCardView()
            PaymentCardView()
                .preferredColorScheme(.dark)
        }
    }
}

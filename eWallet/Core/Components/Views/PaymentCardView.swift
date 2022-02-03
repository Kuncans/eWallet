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
            
            Circle().stroke(lineWidth: 40)
                .frame(width: 100, height: 100)
                .offset(x: -150, y: -30)
                

            
            VStack  {
                HStack {
                    VStack (alignment: .leading, spacing: 0) {
                        Text("Balance")
                            .font(.title3)
                            .foregroundColor(.white)
                        HStack (spacing: 6) {
                            Text("150.00")
                                .font(.title)
                                .bold()
                                .foregroundColor(.white)
                            Text("GBP")
                                .font(.title)
                                .foregroundColor(.white)
                                
                        }
                        
                    }
                    .padding()
                    
                    Spacer()
                    
                    Text("VISA")
                        .font(.title.weight(.bold).italic())
                        .padding()
                        .foregroundColor(.white)
                    
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
                            .frame(maxWidth: 220, alignment: .leading)
                        Text("09/24")
                        Spacer()
                    }
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)

                
            }
            .padding(20)
            .frame(height: 220, alignment: .top)
            
        }
        
        .background(Color.purple.opacity(0.9), in: RoundedRectangle(
            cornerRadius: 30,
            style: .continuous))
        .padding(.horizontal)
    }
        
}

struct PaymentCardView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentCardView()
            //.previewLayout(.sizeThatFits)
            //.padding()
    }
}

//
//  EmptyPaymentCardView.swift
//  eWallet
//
//  Created by Duncan Kent on 04/02/2022.
//

import SwiftUI

struct EmptyPaymentCardView: View {
    var body: some View {
        ZStack {
            Image(systemName: "plus.viewfinder")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.black.opacity(0.5))
                .padding(20)
                .frame(minHeight: 205)
                .frame(maxWidth: 350)
                .background(LinearGradient(colors: [.white, .white.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing).opacity(1))
                .cornerRadius(20)
                .shadow(color: .primary.opacity(0.7), radius: 3, x: 1, y: 1)
                .padding(8)
        }
    }
}



struct EmptyPaymentCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EmptyPaymentCardView()
            EmptyPaymentCardView()
                .preferredColorScheme(.dark)
        }
    }
}

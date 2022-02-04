//
//  HomeView.swift
//  eWallet
//
//  Created by Duncan Kent on 03/02/2022.
//

import SwiftUI


struct HomeView: View {
    
    
    var body: some View {
        
        cardScrollView
        
        Spacer()
        

        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView  {
    private var cardScrollView: some View {
        
        let column: [GridItem] = [GridItem()]

        return GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                
                LazyVGrid (columns: column) {
                    HStack(alignment: .center) {
                        ForEach(MockCard.mockPaymentCardList) { card in
                            PaymentCardView(paymentCard: card)
                                .frame(minWidth: geometry.size.width)
                                .onTapGesture {
                                    print(card.cardNumber)
                                }
                        }
                    }
                }
            }
        }
    }
}

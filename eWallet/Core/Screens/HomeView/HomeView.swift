//
//  HomeView.swift
//  eWallet
//
//  Created by Duncan Kent on 03/02/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State private var emptyCardList: Bool = false
    
    var body: some View {
        
        VStack {
            if !emptyCardList {
                cardScrollView
            }
            
            if emptyCardList {
                Button {
                    print("add new card")
                } label: {
                    EmptyPaymentCardView()
                }

            }
            
            ScrollView (.vertical) {
                ForEach(MockPayment.mockPaymentList) { payment in
                    PaymentCellView(payment: payment)
                }
            }
            .padding(.horizontal)
            
        }
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
                                    //TODO: Add Card Modal/Sheet
                            }
                        }
                    }
                }
            }
        }.frame(maxHeight: 220)
    }
}

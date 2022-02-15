//
//  HomeView.swift
//  eWallet
//
//  Created by Duncan Kent on 03/02/2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var vm = HomeViewModel()
    @State private var emptyCardList: Bool = false
    @State private var presentSheet: Bool = false
    
    var body: some View {
        
        ZStack {
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
                Button {
                    presentSheet.toggle()
                } label: {
                    Text("Add Card")
                }
                
                ScrollView (.vertical) {
                    ForEach(MockPayment.mockPaymentList) { payment in
                        PaymentCellView(payment: payment)
                    }
                }
                .padding(.horizontal)
        
            }
            .sheet(isPresented: $presentSheet, onDismiss: {
                vm.getCards()
            }, content: {
                AddPaymentCardView()
            })
            .onAppear {
                vm.getCards()
            }
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
                        ForEach(vm.savedCards) { card in
                            PaymentCardView(paymentCard: card)
                                .frame(minWidth: geometry.size.width)
                        }
                    }
                }
            }
        }.frame(maxHeight: 220)
    }
}

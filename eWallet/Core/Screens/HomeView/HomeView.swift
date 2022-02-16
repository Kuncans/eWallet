//
//  HomeView.swift
//  eWallet
//
//  Created by Duncan Kent on 03/02/2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var vm = HomeViewModel()
    @State private var presentSheet: Bool = false
    @State private var selectedCard: PaymentCard = MockCard.mockPaymentCard

    
    var body: some View {
        
        ZStack {
            VStack {
                
                if !vm.emptyCardList {
                    cardScrollView
                }
                
                if vm.emptyCardList {
                    Button {
                        presentSheet = true
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

        }
        .onAppear {
            vm.getCards()
            vm.checkEmptyList()
        }
        .navigationBarHidden(true)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView  {
//    private var cardScrollView: some View {
//
//        let column: [GridItem] = [GridItem()]
//
//        return GeometryReader { geometry in
//            ScrollView(.horizontal, showsIndicators: false) {
//
//                LazyVGrid (columns: column) {
//                    HStack(alignment: .center) {
//                        ForEach(vm.savedCards) { card in
//                            PaymentCardView(paymentCard: card)
//                                .frame(minWidth: geometry.size.width)
//                        }
//                    }
//                }
//            }
//        }.frame(maxHeight: 220)
//    }
    
    private var cardScrollView: some View {
        TabView (selection: $selectedCard) {
            ForEach(vm.savedCards) { card in
                PaymentCardView(paymentCard: card).tag(card)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .frame(maxHeight: 220)
        .tabViewStyle(.page)
    }
}

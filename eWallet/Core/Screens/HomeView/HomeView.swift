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
                        .padding(.top, 16)
                }
                
                if vm.emptyCardList {
                    Button {
                        presentSheet = true
                    } label: {
                        EmptyPaymentCardView()
                            .padding(.top, 16)
                    }

                }
                
                ScrollView (.vertical) {
                    ForEach(MockPayment.mockPaymentList) { payment in
                        PaymentCellView(payment: payment)
                    }
                }
                .padding(.horizontal)
                
                NavigationLink {
                    AddPaymentFormView()
                } label: {
                    Text("Add Transaction")
                }

        
            }
            .sheet(isPresented: $presentSheet, onDismiss: {
                vm.getCards()
            }, content: {
                NavigationView {
                    AddPaymentCardView()
                }
            })

        }
        .onAppear {
            vm.getCards()
            vm.checkEmptyList()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    
                    Image("Profile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 44, height: 44)
                        .clipShape(Circle())
                        .padding(.horizontal, 8)
                    
                    VStack (alignment: .leading) {
                        Text("Good day,")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("Duncan Kent")
                            .font(.headline)
                            .foregroundColor(.primary)
                    }
                  
                }
            }

            
            ToolbarItem(placement: .navigationBarTrailing) {
                
                Button {
                    presentSheet = true
                } label: {
                    AddButtonView()

                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
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

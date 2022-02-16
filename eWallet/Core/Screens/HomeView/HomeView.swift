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
        
    var body: some View {
        
        ZStack {
            VStack {
                
                if !vm.emptyCardList {
                    cardScrollView
                        .padding(.top, -80 )
                }
                
                if vm.emptyCardList {
                    Button {
                        presentSheet = true
                    } label: {
                        EmptyPaymentCardView()
                            .padding(.top, -80)
                    }

                }
                
//                ScrollView (.vertical) {
//                    ForEach(MockPayment.mockPaymentList) { payment in
//                        PaymentCellView(payment: payment)
//                    }
//                }
//                .padding(.horizontal)
                                
                Text("Discover")
                    .font(.title2)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 32)
                    .padding(.top)
                
                CategoryIconGridView()
                
        
            }
            .sheet(isPresented: $presentSheet, onDismiss: {
                vm.getCards()
                vm.updateSelectedCard()
            }, content: {
                NavigationView {
                    AddPaymentCardView()
                }
            })

        }
        .onAppear {
            vm.checkEmptyList()
            vm.updateSelectedCard()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
       
                    
                    HStack {
                        
                        Image("Profile")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 36, height: 36)
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
    
    private var cardScrollView: some View {
        TabView (selection: $vm.selectedCard) {
            ForEach(vm.savedCards) { card in
                PaymentCardView(paymentCard: card).tag(card)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .frame(maxHeight: 220)
        .tabViewStyle(.page)
        .onTapGesture {
            print("\(String(describing: vm.selectedCard)))")
        }
    }
}

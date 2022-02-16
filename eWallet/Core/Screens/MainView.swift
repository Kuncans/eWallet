//
//  MainView.swift
//  eWallet
//
//  Created by Duncan Kent on 16/02/2022.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedIndex = 1
    
    var body: some View {
        
        TabView (selection: $selectedIndex) {
            
            NavigationView{
                HomeView()
            }
            .tabItem {
                Image(systemName: "house")
            }
            
            NavigationView {
                CategoryIconGridView()
            }
            .tabItem {
                Image(systemName: "creditcard")
            }
            
            NavigationView {
                AddPaymentFormView()

            }
            .tabItem {
                Image(systemName: "cart.badge.plus")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

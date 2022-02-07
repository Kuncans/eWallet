//
//  CategoryIconGridView.swift
//  eWallet
//
//  Created by Duncan Kent on 07/02/2022.
//

import SwiftUI

struct CategoryIconGridView: View {
    
    let columns = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        
        VStack {
            LazyVGrid (columns: columns, spacing: 22) {
                ForEach(paymentType.allCases, id: \.self) { category in
                    CategoryIconView(color: category.paymentColor,
                                     symbol: category.paymentSymbol,
                                     text: category.rawValue.capitalized)
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }
}

struct CategoryIconGridView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryIconGridView()
    }
}

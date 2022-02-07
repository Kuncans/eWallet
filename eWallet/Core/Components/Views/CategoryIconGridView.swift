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
            
            LazyVGrid (columns: columns) {
                ForEach(paymentType.allCases, id: \.self) { category in
                    CategoryIconView(color: category.paymentColor,
                                     symbol: category.paymentSymbol,
                                     text: category.rawValue.capitalized)
                }
                .padding()
            }
            .padding()
            
        }
        
    }
}
//
//Section("Card Personalization") {
//    Picker("Card Color", selection: $newCardColor) {
//        ForEach(cardColor.allCases, id: \.self) { color in
//            HStack {
//                RoundedRectangle(cornerRadius: 10)
//                    .gradientForeground(colors: color.color)
//                    .frame(width: 32, height: 32)
//                    .padding(.trailing, 8)
//                Text(color.rawValue.capitalized)
//                    .frame(maxWidth: 60, alignment: .leading)
//            }
//        }
//    }

struct CategoryIconGridView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryIconGridView()
    }
}

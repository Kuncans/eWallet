//
//  CategoryIconView.swift
//  eWallet
//
//  Created by Duncan Kent on 07/02/2022.
//

import SwiftUI

struct CategoryIconView: View {
    
    let color: Color
    let symbol: String
    let text: String

    var body: some View {
        
        
        VStack {
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 60, height: 60)
                    .foregroundColor(color.opacity(0.2))
                
                Image(systemName: symbol)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32)
                    .foregroundColor(color.opacity(0.8))
                    
            }
            .frame(width: 60, height: 60)
            
            Text(text)
                .font(.caption)
            
        }
        
    }
}

struct CategoryIconView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryIconView(color: .teal, symbol: "paperplane.fill", text: "Transfers")
    }
}

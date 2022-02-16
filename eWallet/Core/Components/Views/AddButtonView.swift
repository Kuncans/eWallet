//
//  AddButtonView.swift
//  eWallet
//
//  Created by Duncan Kent on 16/02/2022.
//

import SwiftUI

struct AddButtonView: View {
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 36, height: 36)
                .foregroundColor(Color("AccentColor").opacity(0.2))
            
            
            Image(systemName: "plus")
                .frame(width: 32, height: 32)
                .font(.headline)
                .foregroundColor(Color("AccentColor").opacity(0.8))

        }
        .padding(.horizontal, 8)

    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

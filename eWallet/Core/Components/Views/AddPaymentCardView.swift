//
//  AddPaymentCardView.swift
//  eWallet
//
//  Created by Duncan Kent on 05/02/2022.
//

import SwiftUI

struct AddPaymentCardView: View {
    var body: some View {
        
        Form {
            
            EmptyPaymentCardView()
            
        }
        
    }
}

struct AddPaymentCardView_Previews: PreviewProvider {
    static var previews: some View {
        AddPaymentCardView()
    }
}

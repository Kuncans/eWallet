//
//  EditPaymentCardViewModel.swift
//  eWallet
//
//  Created by Duncan Kent on 17/02/2022.
//

import Foundation
import SwiftUI

final class EditPaymentCardViewModel: ObservableObject {
    
    @Published var balance: Double = 0.0
    @Published var cardNumber: String = ""
    @Published var expiryYear: String = ""
    @Published var expiryMonth: String = ""
    @Published var newCardType: cardType = .visa
    @Published var cardHolderName: String = ""
    @Published var newCardColor: Color = .blue
    
    let coreDS: CoreDataService

    init() {
        coreDS = CoreDataService.shared
    }
    
    
    
}

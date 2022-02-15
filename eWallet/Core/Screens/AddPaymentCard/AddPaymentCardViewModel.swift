//
//  AddPaymentCardViewModel.swift
//  eWallet
//
//  Created by Duncan Kent on 15/02/2022.
//

import Foundation
import SwiftUI

final class AddPaymentCardViewModel: ObservableObject {
    
    let coreDS: CoreDataService
    
    @Published var balance: Double = 0.0
    @Published var cardNumber: String = ""
    @Published var expiryYear: String = ""
    @Published var expiryMonth: String = ""
    @Published var newCardType: cardType = .visa
    @Published var cardHolderName: String = ""
    @Published var newCardColor: Color = .blue
    
    init() {
        coreDS = CoreDataService.shared
    }
    
    func saveCard() {
        let card = PaymentCard(balance: balance,
                               cardNumber: Int(cardNumber) ?? 0000000000000000,
                               expiry: DateComponents(year: Int(expiryYear), month: Int(expiryMonth)),
                               cardType: newCardType,
                               cardHolder: cardHolderName,
                               cardColor: UIColor(newCardColor))
        
//        let card = CardEntity(context: coreDS.container.viewContext)
//        card.balance = balance
//        card.cardColor = UIColor(newCardColor)
//        card.cardNumber = Int32(cardNumber) ?? 0
//        card.cardID = UUID()
//        card.cardTypeAsString = newCardType.rawValue
//        card.expiryString = "\(expiryMonth)/\(expiryYear)"
//        card.cardHolder = cardHolderName
        
        coreDS.add(card: card)
        coreDS.save()
    }
    
}

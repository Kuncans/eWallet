//
//  PaymentCard.swift
//  eWallet
//
//  Created by Duncan Kent on 03/02/2022.
//

import Foundation

struct PaymentCard {
    let cardID = UUID()
    let balance: Double
    let cardNumber: String
    let expiry: DateComponents
    let cardType: String
    let cardHolder: String
}

struct MockCard {
    
    static let mockPaymentCard = PaymentCard(balance: 2400.42,
                                      cardNumber: "3904 **** **** 3094",
                                      expiry: DateComponents(month: 03, day: 26),
                                      cardType: "visa",
                                      cardHolder: "d t kent")
    
}

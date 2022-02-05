//
//  PaymentCard.swift
//  eWallet
//
//  Created by Duncan Kent on 03/02/2022.
//

import Foundation
import SwiftUI

struct PaymentCard: Identifiable, Hashable {
    let id = UUID()
    let balance: Double
    let cardNumber: Int
    let expiry: DateComponents
    let cardType: cardType
    let cardHolder: String
    let cardColor: cardColor
    var hiddenCard: String.SubSequence {
        let oldString = String(cardNumber)
        let newString = oldString.prefix(4) + " **** **** " + oldString.suffix(4)
        return newString
    }
}

struct MockCard {
    
    static let mockPaymentCard = PaymentCard(balance: 2400.42,
                                             cardNumber: 3904039409304938,
                                             expiry: DateComponents(month: 03, day: 26),
                                             cardType: .mastercard,
                                             cardHolder: "a c holder",
                                             cardColor: .blue)
    
    static let mockPaymentCardList: [PaymentCard] = [PaymentCard(balance: 2400.42,
                                                                 cardNumber: 3904039409304938,
                                                                 expiry: DateComponents(month: 03, day: 26),
                                                                 cardType: .visa,
                                                                 cardHolder: "a c holder1",
                                                                 cardColor: .blue),
                                                     PaymentCard(balance: 1345.25,
                                                                 cardNumber: 0194883949403948,
                                                                 expiry: DateComponents(month: 04, day: 27),
                                                                 cardType: .amex,
                                                                 cardHolder: "a c holder2",
                                                                 cardColor: .purple),
                                                     
                                                     PaymentCard(balance: 843.29,
                                                                 cardNumber: 4394903999403940,
                                                                 expiry: DateComponents(month: 05, day: 28),
                                                                 cardType: .mastercard,
                                                                 cardHolder: "a c holder3",
                                                                 cardColor: .orange),
                                                     
                                                     PaymentCard(balance: 843.29,
                                                                 cardNumber: 4394903999403940,
                                                                 expiry: DateComponents(month: 05, day: 28),
                                                                 cardType: .mastercard,
                                                                 cardHolder: "a c holder3",
                                                                 cardColor: .red),
                                                     

    ]
    
    static let mockPaymentSingleCardList: [PaymentCard] = [PaymentCard(balance: 2400.42,
                                                                       cardNumber: 3904039409304938,
                                                                       expiry: DateComponents(month: 03, day: 26),
                                                                       cardType: .visa,
                                                                       cardHolder: "a c holder1",
                                                                       cardColor: .red)
    ]
    
    static let mockPaymentDoubleCardList: [PaymentCard] = [PaymentCard(balance: 2400.42,
                                                                 cardNumber: 3904039409304938,
                                                                 expiry: DateComponents(month: 03, day: 26),
                                                                 cardType: .visa,
                                                                 cardHolder: "a c holder1",
                                                                 cardColor: .orange),
                                                     PaymentCard(balance: 1345.25,
                                                                 cardNumber: 0194883949403948,
                                                                 expiry: DateComponents(month: 04, day: 27),
                                                                 cardType: .amex,
                                                                 cardHolder: "a c holder2",
                                                                 cardColor: .purple)                                        
    ]
    
}

enum cardType: String, CaseIterable, Identifiable {
    
    var id: String { self.rawValue }
    
    case visa
    case amex
    case mastercard
}

enum cardColor: String, CaseIterable, Identifiable {
    
    var id: String { self.rawValue }

    case blue
    case purple
    case red
    case green
    case black
    case orange

}

extension cardColor {
    
    var color: [Color] {
        
        switch (self) {
        case .blue:
            return [.blue, .teal]
        case .purple:
            return [.purple, .indigo]
        case .red:
            return [.red, .pink]
        case .green:
            return [.green, .mint]
        case .black:
            return [.black, .gray]
        case .orange:
            return [.orange, .brown]
        }
    }
}

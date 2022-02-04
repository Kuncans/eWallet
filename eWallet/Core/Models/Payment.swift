//
//  Payment.swift
//  eWallet
//
//  Created by Duncan Kent on 04/02/2022.
//

import Foundation

struct Payment: Identifiable, Equatable {
    let toFrom: String
    let amount: Double
    let time: DateComponents
    let type: paymentType
    let outgoing: Bool
     
    var id: String {
        toFrom + String(time.hashValue)
    }
    
    static func == (lhs: Payment, rhs: Payment) -> Bool {
        lhs.id == rhs.id
    }
}

struct MockPayment {
    
    static let mockPayment = Payment(toFrom: "Argos", amount: 25.42, time: DateComponents(), type: .travel, outgoing: true)
    
}

enum paymentType {
    case transfer
    case internet
    case games
    case travel
    case utilities
    case bills
    case health
    case personal
    case food
}

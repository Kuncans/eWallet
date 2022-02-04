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
    
    var dateString: String? {
        guard
                let year = time.year,
                let month = time.month,
                let day = time.day
        else { return nil }
        
        return String(day) + "/" + String(month) + "/" + String(year).suffix(2)

    }
    
    var timeString: String? {
        guard
            let hour = time.hour,
            let minute = time.minute
        else { return nil }
        
        return String(hour) + ":" + String(minute)
    }
    
    static func == (lhs: Payment, rhs: Payment) -> Bool {
        lhs.id == rhs.id
    }
}

struct MockPayment {
    
    static let mockPayment = Payment(toFrom: "Riot Games",
                                     amount: 25.00,
                                     time: DateComponents(year: 2022,
                                                          month: 3,
                                                          day: 11,
                                                          hour: 18,
                                                          minute: 43),
                                     type: .games,
                                     outgoing: true)
    
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

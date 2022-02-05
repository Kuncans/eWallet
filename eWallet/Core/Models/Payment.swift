//
//  Payment.swift
//  eWallet
//
//  Created by Duncan Kent on 04/02/2022.
//

import Foundation
import SwiftUI

struct Payment: Identifiable, Equatable {
    let toFrom: String
    let amount: Decimal
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
    
    // Equatable Check
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
    
    static let mockPaymentList: [Payment] = [Payment(toFrom: "Riot Games",
                                                     amount: 25.00,
                                                     time: DateComponents(year: 2022,
                                                                          month: 3,
                                                                          day: 16,
                                                                          hour: 20,
                                                                          minute: 55),
                                                     type: .games,
                                                     outgoing: true),
                                             
                                             Payment(toFrom: "Tesco",
                                                    amount: 42.03,
                                                    time: DateComponents(year: 2022,
                                                                        month: 3,
                                                                        day: 15,
                                                                        hour: 14,
                                                                        minute: 59),
                                                    type: .food,
                                                    outgoing: true),
                                             
                                             Payment(toFrom: "Spotify",
                                                    amount: 9.99,
                                                    time: DateComponents(year: 2022,
                                                                        month: 3,
                                                                        day: 14,
                                                                        hour: 19,
                                                                        minute: 43),
                                                    type: .entertainment,
                                                    outgoing: true),
                                             
                                             Payment(toFrom: "Car Insurance",
                                                    amount: 33.45,
                                                    time: DateComponents(year: 2022,
                                                                        month: 3,
                                                                        day: 13,
                                                                        hour: 04,
                                                                        minute: 13),
                                                    type: .bills,
                                                    outgoing: true),
                                             
                                             Payment(toFrom: "Santander ATM",
                                                    amount: 100.00,
                                                    time: DateComponents(year: 2022,
                                                                        month: 3,
                                                                        day: 12,
                                                                        hour: 18,
                                                                        minute: 43),
                                                    type: .transfer,
                                                    outgoing: false)
    ]
    
}

enum paymentType: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    
    case entertainment
    case internet
    case games
    case travel
    case utilities
    case bills
    case health
    case transfer
    case food
    case personal
}

extension paymentType {
    var paymentColor: Color {
        
        switch (self) {
        case .transfer:
            return .teal
        case .internet:
            return .pink
        case .games:
            return .red
        case .travel:
            return .blue
        case .utilities:
            return .purple
        case .bills:
            return .orange
        case .health:
            return .green
        case .personal:
            return .cyan
        case .food:
            return .yellow
        case .entertainment:
            return .pink
        }
    }
    
    var paymentSymbol: String {
        
        switch (self) {
        case .transfer:
            return "paperplane.fill"
        case .internet:
            return "globe"
        case .games:
            return "gamecontroller.fill"
        case .travel:
            return "train.side.front.car"
        case .utilities:
            return "bolt.fill"
        case .bills:
            return "doc.text.fill"
        case .health:
            return "heart.fill"
        case .personal:
            return "person.fill"
        case .food:
            return "cart.fill"
        case .entertainment:
            return "tv.fill"
        }
        
    }
}

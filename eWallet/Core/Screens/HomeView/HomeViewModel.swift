//
//  HomeViewModel.swift
//  eWallet
//
//  Created by Duncan Kent on 15/02/2022.
//

import Foundation
import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @Published var savedCards: [PaymentCard] = []
    @Published var emptyCardList: Bool = true
    @Published var selectedCard: PaymentCard = MockCard.mockPaymentCard

    let coreDS: CoreDataService
    
    init() {
        coreDS = CoreDataService.shared
        getCards()
    }
    
    func getCards() {
        DispatchQueue.main.async {
            self.savedCards = self.coreDS.getCards()
            self.checkEmptyList()
        }
    }
    
    func checkEmptyList() {
        emptyCardList = savedCards.isEmpty
    }
    
    func updateSelectedCard() {
        DispatchQueue.main.async {
            if let card = self.savedCards.first {
                self.selectedCard = card
            }
        }
    }
        
}



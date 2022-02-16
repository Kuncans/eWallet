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
        
}



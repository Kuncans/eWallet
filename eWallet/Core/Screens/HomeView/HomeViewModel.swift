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
    
    let coreDS: CoreDataService
    
    init() {
        coreDS = CoreDataService.shared
    }
    
    func getCards() {
        DispatchQueue.main.async {
            self.savedCards = self.coreDS.getCards()
            print("Saved Cards: \(self.savedCards)")
        }
    }
    
}



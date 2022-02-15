//
//  HomeViewModel.swift
//  eWallet
//
//  Created by Duncan Kent on 15/02/2022.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published var savedCards: [PaymentCard] = []
    
    private let coreDS = CoreDataService.shared
    
    init() {
        savedCards = coreDS.getCards()
    }
    
}



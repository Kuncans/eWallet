//
//  CoreDataService.swift
//  eWallet
//
//  Created by Duncan Kent on 15/02/2022.
//

import Foundation
import CoreData

class CoreDataService: ObservableObject {
    
    private let container: NSPersistentContainer
    private let containerName: String = "EWalletContainer"
    private let entityName: String = "CardEntity"
    
    @Published var savedCards: [CardEntity] = []
    
}

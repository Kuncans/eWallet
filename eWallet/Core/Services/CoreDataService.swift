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
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error loading Core Data \(error)")
            }
        }
    }
    
    func updateCard(card: PaymentCard) {
        if let entity = savedCards.first(where: { $0.cardID == card.id }) {
            update(entity: entity, card: card)
        }
    }
    
    private func getSavedCards() {
        let request = NSFetchRequest<CardEntity>(entityName: entityName)
        do {
            savedCards = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching saved Cards \(error)")
        }
    }
    
    private func add(card: PaymentCard) {
        let entity = CardEntity(context: container.viewContext)
        entity.balance = card.balance
        entity.cardID = card.id
        entity.cardNumber = Int32(card.cardNumber)
        entity.expiryString = card.expiryString
        entity.cardTypeAsString = card.cardType.id
        entity.cardHolder = card.cardHolder
        entity.cardColor = card.cardColor
    }
    
    private func update(entity: CardEntity, card: PaymentCard) {
        entity.balance = card.balance
        entity.cardID = card.id
        entity.cardNumber = Int32(card.cardNumber)
        entity.expiryString = card.expiryString
        entity.cardTypeAsString = card.cardType.id
        entity.cardHolder = card.cardHolder
        entity.cardColor = card.cardColor
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving to Core Data \(error)")
        }
    }
    
    private func remove(entity: CardEntity) {
        container.viewContext.delete(entity)
    }
    
}

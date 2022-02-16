//
//  CoreDataService.swift
//  eWallet
//
//  Created by Duncan Kent on 15/02/2022.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataService {
    
    static let shared = CoreDataService()
    
    let container: NSPersistentContainer
    private let containerName: String = "EWalletContainer"
    private let entityName: String = "CardEntity"
    
    private var savedCards: [CardEntity] = []
    
    private init() {
        
        ValueTransformer.setValueTransformer(UIColorTransformer(), forName: NSValueTransformerName("UIColorTransformer"))
        
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error loading Core Data \(error)")
            }
        }
        getSavedCards()
    }
    
    public func getCards() -> [PaymentCard] {
        return mapCardEntityToModel(savedCards: savedCards)
    }
    

    
    public func updateCard(card: PaymentCard) {
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
    
    private func mapCardEntityToModel(savedCards: [CardEntity]) -> [PaymentCard] {
        
        var updatedCards: [PaymentCard] = []
        
        savedCards.forEach { card in
            do {
                try updatedCards.append(mapToCardModel(card: card))
            } catch let error {
                print("Could not convert to card model \(error).")
            }
        }
        
        return updatedCards
    }
    
    func add(card: PaymentCard) {
        let entity = CardEntity(context: container.viewContext)
        entity.balance = card.balance
        entity.cardID = card.id
        entity.cardNumber = Int64(card.cardNumber)
        entity.expiryString = card.expiryString
        entity.cardTypeAsString = card.cardType.id
        entity.cardHolder = card.cardHolder
        entity.cardColor = card.cardColor
        
        save()
        
    }
    
    func update(entity: CardEntity, card: PaymentCard) {
        entity.balance = card.balance
        entity.cardID = card.id
        entity.cardNumber = Int64(card.cardNumber)
        entity.expiryString = card.expiryString
        entity.cardTypeAsString = card.cardType.id
        entity.cardHolder = card.cardHolder
        entity.cardColor = card.cardColor
        
        save()
    }
    
    func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            container.viewContext.rollback()
            print("Error saving to Core Data \(error)")
        }
        
        getSavedCards()
    }
    
    func remove(card: PaymentCard) {
        
        if let entity = savedCards.first(where: { $0.cardID == card.id }) {
            
            container.viewContext.delete(entity)
            
            save()
        }
    }
    
    private func mapToCardModel(card: CardEntity) throws -> PaymentCard {
        
        return PaymentCard(balance: card.balance,
                    cardNumber: Int(card.cardNumber),
                    expiry: DateComponents(month: Int(card.expiryString?.prefix(2) ?? ""), day: Int(card.expiryString?.suffix(2) ?? "")),
                    cardType: cardType(rawValue: card.cardTypeAsString) ?? cardType.visa,
                    cardHolder: card.cardHolder ?? "Unknown",
                    cardColor: card.cardColor ?? UIColor(.blue))
    }
    
}


//
//  CardEntity+CoreDataProperties.swift
//  eWallet
//
//  Created by Duncan Kent on 15/02/2022.
//
//

import Foundation
import CoreData
import UIKit

extension CardEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CardEntity> {
        return NSFetchRequest<CardEntity>(entityName: "CardEntity")
    }

    @NSManaged public var balance: Double
    @NSManaged public var cardColor: UIColor?
    @NSManaged public var cardHolder: String?
    @NSManaged public var cardID: UUID?
    @NSManaged public var cardNumber: Int32
    @NSManaged public var cardTypeAsInt: Int32
    @NSManaged public var expiryString: String?
    @NSManaged public var transaction: NSSet?

}

// MARK: Generated accessors for transaction
extension CardEntity {

    @objc(addTransactionObject:)
    @NSManaged public func addToTransaction(_ value: TransactionEntity)

    @objc(removeTransactionObject:)
    @NSManaged public func removeFromTransaction(_ value: TransactionEntity)

    @objc(addTransaction:)
    @NSManaged public func addToTransaction(_ values: NSSet)

    @objc(removeTransaction:)
    @NSManaged public func removeFromTransaction(_ values: NSSet)

}

extension CardEntity : Identifiable {

}

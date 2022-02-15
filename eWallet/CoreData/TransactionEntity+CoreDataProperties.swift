//
//  TransactionEntity+CoreDataProperties.swift
//  eWallet
//
//  Created by Duncan Kent on 15/02/2022.
//
//

import Foundation
import CoreData


extension TransactionEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TransactionEntity> {
        return NSFetchRequest<TransactionEntity>(entityName: "TransactionEntity")
    }

    @NSManaged public var amount: NSDecimalNumber?
    @NSManaged public var cardTypeAsInt: Int32
    @NSManaged public var dateString: String?
    @NSManaged public var outgoing: Bool
    @NSManaged public var timeString: String?
    @NSManaged public var toFrom: String?
    @NSManaged public var card: CardEntity?

}

extension TransactionEntity : Identifiable {

}

//
//  AddPaymentFormViewModel.swift
//  eWallet
//
//  Created by Duncan Kent on 16/02/2022.
//

import Foundation

final class AddPaymentFormViewModel: ObservableObject {
    
    let coreDS: CoreDataService

    init() {
        coreDS = CoreDataService.shared
    }
    
}

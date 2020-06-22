//
//  ItemListInteractor.swift
//  Restaurant
//
//  Created by Mac on 6/22/20.
//Copyright © 2020 Amrit Duwal. All rights reserved.
//

import Foundation

class ItemListInteractor {
    
	// MARK: Properties
    
    weak var output: ItemListInteractorOutput?
    private let service: ItemListServiceType
    
    // MARK: Initialization
    
    init(service: ItemListServiceType) {
        self.service = service
    }

    // MARK: Converting entities
}

// MARK: ItemList interactor input interface

extension ItemListInteractor: ItemListInteractorInput {
    func doOrderTheFood(subTotal: Int, discountTotal: Int, taxTotal: Int, netTotal: Int, quantity: Int, netPrice: Int, discount: Int) {
        service.createOrder(subTotal: subTotal, discountTotal: discountTotal, taxTotal: taxTotal, netTotal: netTotal, quantity: quantity, netPrice: netPrice, discount: discount, success: { [weak self] (success) in
            self?.output?.obtained(successMessage: success.message)
            
        }) {[weak self] (error) in
            self?.output?.obtained(error: error)
        }
    }
    
    
}

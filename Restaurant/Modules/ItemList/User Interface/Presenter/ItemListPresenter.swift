//
//  ItemListPresenter.swift
//  Restaurant
//
//  Created by Mac on 6/22/20.
//Copyright © 2020 Amrit Duwal. All rights reserved.
//

import Foundation

class ItemListPresenter {
    
    // MARK: Properties
    
    weak var view: ItemListViewInterface?
    var interactor: ItemListInteractorInput?
    var wireframe: ItemListWireframeInput?
    
    // MARK: Converting entities
}

// MARK: ItemList module interface

extension ItemListPresenter: ItemListModuleInterface {
    func orderTheFood(subTotal: Int, discountTotal: Int, taxTotal: Int, netTotal: Int, quantity: Int, netPrice: Int, discount: Int) {
        DispatchQueue.main.async {
            self.view?.showLoading()
        }
        interactor?.doOrderTheFood(subTotal: subTotal, discountTotal: discountTotal, taxTotal: taxTotal, netTotal: netTotal, quantity: quantity, netPrice: netPrice, discount: discount)
    }
    
    
}

// MARK: ItemList interactor output interface

extension ItemListPresenter: ItemListInteractorOutput {
    func obtained(successMessage: String) {
        DispatchQueue.main.async {
            self.view?.hideLoading()
            self.view?.show(success: successMessage)
        }
    }
    
    func obtained(error: Error) {
        DispatchQueue.main.async {
            self.view?.hideLoading()
            self.view?.show(error: error)
        }
    }
    
    
}
